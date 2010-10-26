clc; % Ryd workspace
clear; % Ryd alle variabler

x0 = 0;
x1 = 0;
x2 = 0;
x3 = 0;

for x0 = 0:3
%    [x0,x1,x2,x3]
	for x1 = 0:3
        if (sum([x0,x1,x2,x3]) < 5)
%            [x0,x1,x2,x3]
            for x2 = 0:2
%                [x0,x1,x2,x3]
                if (sum([x0,x1,x2,x3]) < 5)
                    for x3 = 0:1
%                        [x0,x1,x2,x3]
                        if (sum([x0,x1,x2,x3]) < 5)
                            [x0,x1,x2,x3];
                            tal = zeros(1,4);
                            tal(x0 + 1) = tal(x0 + 1) + 1;
                            tal(x1 + 1) = tal(x1 + 1) + 1;
                            tal(x2 + 1) = tal(x2 + 1) + 1;
                            tal(x3 + 1) = tal(x3 + 1) + 1;
                            if (tal == [x0,x1,x2,x3])
                                rigtig = [x0,x1,x2,x3]
                            end
                        end
                    end
                    x3 = 0;
                end
            end
            x2 = 0;
        end
    end
    x1 = 0;
end
