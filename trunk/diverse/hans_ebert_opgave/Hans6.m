clc; % Ryd workspace
clear; % Ryd alle variabler

x0 = 0;
x1 = 0;
x2 = 0;
x3 = 0;
x4 = 0;
x5 = 0;

for x0 = 0:5
%    [x0,x1,x2,x3,x4,x5]
	for x1 = 0:5
        if (sum([x0,x1,x2,x3,x4,x5]) < 7)
%            [x0,x1,x2,x3,x4,x5]
            for x2 = 0:2
%                [x0,x1,x2,x3,x4,x5]
                if (sum([x0,x1,x2,x3,x4,x5]) < 7)
                    for x3 = 0:1
%                        [x0,x1,x2,x3,x4,x5]
                        if (sum([x0,x1,x2,x3,x4,x5]) < 7)
                            for x4 = 0:1
%                                [x0,x1,x2,x3,x4,x5]
                                if (sum([x0,x1,x2,x3,x4,x5]) < 7)
                                    for x5 = 0:1
%                                        [x0,x1,x2,x3,x4,x5]
                                        if (sum([x0,x1,x2,x3,x4,x5]) < 7)
                                            [x0,x1,x2,x3,x4,x5];
                                            tal = zeros(1,6);
                                            tal(x0 + 1) = tal(x0 + 1) + 1;
                                            tal(x1 + 1) = tal(x1 + 1) + 1;
                                            tal(x2 + 1) = tal(x2 + 1) + 1;
                                            tal(x3 + 1) = tal(x3 + 1) + 1;
                                            tal(x4 + 1) = tal(x4 + 1) + 1;
                                            tal(x5 + 1) = tal(x5 + 1) + 1;
                                            if (tal == [x0,x1,x2,x3,x4,x5])
                                                rigtig = [x0,x1,x2,x3,x4,x5]
                                            end
                                        end
                                    end
                                    x5 = 0;
                                end
                            end
                            x4 = 0;
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
