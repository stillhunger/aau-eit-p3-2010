clc;
clear;

s = tf('s');

%H = 1/(s+1000);
H = (20*s^2+100200*s+1000000)/((s-5000)*(s-100000)); % INDSÆT OVERFØRSELSFUNKTION HER!
gain = 20; % INDSÆT GAIN HER!

farve = 'bgrcmykw';
[P, Z] = pzmap(H)
totalp = max(abs(P));
totalz = max(abs(Z));
if (length(P) > 0)
    if (totalz > totalp)
        total = totalz;
    else
        total = totalp;
    end
else
    total = totalz;
end
total = total * 1000;

if (total < 1000)
    total = 1000;
end

[P, Z] = pzmap(H);
T = ones(1,1);

t = 1;
for n=2:total
    for u = 3:9
        if (t >= 10^u)
            U = u;
        end
    end
    if ( n > 1000)
        t = (10^(U+1) - 10^U) / 100 + T(n - 1);
    else
        t = n;
    end
    T(n) = t;
    if (t > total)
        break
    end
end

faseP = zeros(length(P),length(T));
faseZ = zeros(length(Z),length(T));
samlet = zeros(1,length(T));
ampP = zeros(length(P),length(T));
ampZ = zeros(length(Z),length(T));
amp = zeros(1,length(T));

for i=1:length(P) % POL
    if (P(i) > 0)
        faseP(i,:) =  faseP(i,:) - 180;
    elseif (P(i) == 0)
        faseP(i,:) =  faseP(i,:) - 90;
    end
    if (P(i) ~= 0)
        ampP(i,:) = -(20 * log10(abs(P(i))));
    else
        ampP(i,1) = 46.0206;
    end
    for n=2:length(T)
        t = T(n);
        if (P(i) >= 0) % FASE
            if (t/10 >= P(i) / 10 && t/10 <= P(i) * 10)
                if (P(i) ~= 0)
                    a = 19.543251686 * reallog(P(i)) - 45;
                else
                    a = 0;
                end
                faseP(i,n) = (19.543251686 * reallog(t/10) - a) - 180;
            else
                faseP(i,n) = faseP(i,n - 1);
            end
        else
            if (t/10 >= -P(i) / 10 && t/10 <= -P(i) * 10)
                a = 19.543251686 * reallog(-P(i)) - 45;
                faseP(i,n) = -(19.543251686 * reallog(t/10) - a);
            else
                faseP(i,n) = faseP(i,n - 1);
            end
        end
        if (t/10 >= abs(P(i)) || P(i) == 0) % AMP
            if (P(i) ~= 0)
                a = 8.68588963806504 * reallog(abs(P(i)));
            else
                a = 26.0206;
            end
            ampP(i,n) = -(8.68588963806504 * reallog(t/10) - a) + ampP(i,n);
        else
            ampP(i,n) = ampP(i,n - 1);
        end
    end
end

for i=1:length(Z) % NULPUNKT
    if (Z(i) > 0)
        faseZ(i,:) =  faseZ(i,:) + 180;
    elseif (Z(i) == 0)
        faseZ(i,:) =  faseZ(i,:) + 90;
    end
    if (Z(i) ~= 0)
        ampZ(i,:) = 20 * log10(abs(Z(i)));
    else
        ampZ(i,1) = -20;
    end
    t = 1;
    for n=2:length(T)
        t = T(n);
        if (Z(i) >= 0) % FASE
            if (t/10 >= Z(i) / 10 && t/10 <= Z(i) * 10)
                if (Z(i) ~= 0)
                    a = 19.543251686 * reallog(Z(i)) - 45;
                else
                    a = 0;
                end
                faseZ(i,n) = -(19.543251686 * reallog(t/10) - a) + 180;
            else
                faseZ(i,n) = faseZ(i,n - 1);
            end
        else
            if (t/10 >= -Z(i) / 10 && t/10 <= -Z(i) * 10)
                a = 19.543251686 * reallog(abs(Z(i))) - 45;
                faseZ(i,n) = (19.543251686 * reallog(t/10) - a);
            else
                faseZ(i,n) = faseZ(i,n - 1);
            end
        end
        if (t/10 >= abs(Z(i)) || Z(i) == 0) % AMP
            if (Z(i) ~= 0)
                a = 8.68588963806504 * reallog(abs(Z(i)));
            else
                a = 0;
            end
            ampZ(i,n) = (8.68588963806504 * reallog(t/10) - a) + ampZ(i,n);
        else
            ampZ(i,n) = ampZ(i,n - 1);
        end
    end
end

T = T / 10;
figure(1);
subplot(2,1,1);
for i=1:length(P)
    semilogx(T,faseP(i,:),farve(i));
    hold on;
    samlet = samlet + faseP(i,:);
end
if (isempty(P))
    i = 0;
end
for n=1:length(Z)
    semilogx(T,faseZ(n,:),farve(i+n));
    hold on;
    samlet = samlet + faseZ(n,:);
end
grid
title('Fasekarakteristik','fontsize',20,'fontweight','bold')

subplot(2,1,2);
semilogx(T,samlet);
grid
xlabel('Frekvens [Hz]')
ylabel('Samlet')

figure(2)
subplot(2,1,1);
offset = 0;
if (gain ~= 0)
    offset = 20 * log10(abs(gain));
end
for i=1:length(P)
    semilogx(T,ampP(i,:),farve(i));
    hold on;
    amp = amp + ampP(i,:);
end
if (isempty(P))
    i = 0;
end
for n=1:length(Z)
    semilogx(T,ampZ(n,:),farve(i+n));
    hold on;
    amp = amp + ampZ(n,:);
end
grid
title('Amplitudekarakteristik','fontsize',20,'fontweight','bold')

amp = amp + offset;
subplot(2,1,2);
semilogx(T,amp)
grid
xlabel('Frekvens [Hz]')
ylabel('Samlet')

figure(3)
bode(H)
grid
