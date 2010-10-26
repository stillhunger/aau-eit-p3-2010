clc; % Ryd workspace
clear; % Ryd alle variabler

x0 = 0;
x1 = 0;
x2 = 0;
x3 = 0;
x4 = 0;
x5 = 0;
x6 = 0;
x7 = 0;
x8 = 0;
x9 = 0;

for x0 = 0:9
%    [x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]
	for x1 = 0:9
        if (sum([x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]) < 11)
%            [x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]
            for x2 = 0:4
%                [x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]
                if (sum([x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]) < 11)
                    for x3 = 0:3
%                        [x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]
                        if (sum([x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]) < 11)
                            for x4 = 0:2
%                                [x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]
                                if (sum([x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]) < 11)
                                    for x5 = 0:1
%                                        [x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]
                                        if (sum([x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]) < 11)
                                            for x6 = 0:1
%                                                [x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]
                                                if (sum([x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]) < 11)
                                                    for x7 = 0:1
%                                                        [x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]
                                                        if (sum([x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]) < 11)
                                                            for x8 = 0:1
%                                                                [x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]
                                                                if (sum([x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]) < 11)
                                                                    for x9 = 0:1
                                                                        if (sum([x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]) < 11)
                                                                            [x0,x1,x2,x3,x4,x5,x6,x7,x8,x9];
                                                                            tal = zeros(1,10);
                                                                            tal(x0 + 1) = tal(x0 + 1) + 1;
                                                                            tal(x1 + 1) = tal(x1 + 1) + 1;
                                                                            tal(x2 + 1) = tal(x2 + 1) + 1;
                                                                            tal(x3 + 1) = tal(x3 + 1) + 1;
                                                                            tal(x4 + 1) = tal(x4 + 1) + 1;
                                                                            tal(x5 + 1) = tal(x5 + 1) + 1;
                                                                            tal(x6 + 1) = tal(x6 + 1) + 1;
                                                                            tal(x7 + 1) = tal(x7 + 1) + 1;
                                                                            tal(x8 + 1) = tal(x8 + 1) + 1;
                                                                            tal(x9 + 1) = tal(x9 + 1) + 1;
                                                                            if (tal == [x0,x1,x2,x3,x4,x5,x6,x7,x8,x9])
                                                                                rigtig = [x0,x1,x2,x3,x4,x5,x6,x7,x8,x9]
                                                                            end
                                                                        end
                                                                    end
                                                                    x9 = 0;
                                                                end
                                                            end
                                                            x8 = 0;
                                                        end
                                                    end
                                                    x7 = 0;
                                                end
                                            end
                                            x6 = 0;
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
