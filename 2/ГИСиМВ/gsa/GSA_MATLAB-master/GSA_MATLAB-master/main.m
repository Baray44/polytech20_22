function main ()
    bound = [-40 40; -40 40];
    [P,F] = GSA(150, 25, 1000, @test, bound, 0);
    disp([P,F])
    net = feedforwardnet(10, 'trainbfg');
    net = train(net, P, F);
    disp(net)
end