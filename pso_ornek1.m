
% PSO - Sphere Fonksiyonu Minimizasyonu

% Problem Tanımı
CostFunction = @(x) sum(x.^2);  % Sphere fonksiyonu

nVar = 2;              % Değişken sayısı
VarSize = [1 nVar];    % Pozisyon vektör boyutu
VarMin = -10;          % Alt sınır
VarMax = 10;           % Üst sınır

% PSO Parametreleri
MaxIt = 100;           % Maksimum iterasyon
nPop = 30;             % Parçacık sayısı
w = 0.7;               % Eylemsizlik katsayısı
wdamp = 0.99;          % Eylemsizlik azaltma oranı
c1 = 1.5;              % Bireysel öğrenme katsayısı
c2 = 2.0;              % Sosyal öğrenme katsayısı

% Parçacık yapısı
empty_particle.Position = [];
empty_particle.Velocity = [];
empty_particle.Cost = [];
empty_particle.Best.Position = [];
empty_particle.Best.Cost = [];

particle = repmat(empty_particle, nPop, 1);
GlobalBest.Cost = inf;

% Başlangıç popülasyonu
for i = 1:nPop
    particle(i).Position = unifrnd(VarMin, VarMax, VarSize);
    particle(i).Velocity = zeros(VarSize);
    particle(i).Cost = CostFunction(particle(i).Position);
    particle(i).Best.Position = particle(i).Position;
    particle(i).Best.Cost = particle(i).Cost;

    if particle(i).Best.Cost < GlobalBest.Cost
        GlobalBest = particle(i).Best;
    end
end

% PSO Ana Döngü
BestCosts = zeros(MaxIt, 1);
for it = 1:MaxIt
    for i = 1:nPop
        % Hız güncelleme
        particle(i).Velocity = ...
            w * particle(i).Velocity ...
            + c1 * rand(VarSize) .* (particle(i).Best.Position - particle(i).Position) ...
            + c2 * rand(VarSize) .* (GlobalBest.Position - particle(i).Position);

        % Pozisyon güncelleme
        particle(i).Position = particle(i).Position + particle(i).Velocity;

        % Sınır kontrolü
        particle(i).Position = max(particle(i).Position, VarMin);
        particle(i).Position = min(particle(i).Position, VarMax);

        % Değerlendirme
        particle(i).Cost = CostFunction(particle(i).Position);

        % Kendi en iyisini güncelle
        if particle(i).Cost < particle(i).Best.Cost
            particle(i).Best.Position = particle(i).Position;
            particle(i).Best.Cost = particle(i).Cost;

            % Global en iyiyi güncelle
            if particle(i).Best.Cost < GlobalBest.Cost
                GlobalBest = particle(i).Best;
            end
        end
    end

    BestCosts(it) = GlobalBest.Cost;
    w = w * wdamp;

    fprintf('Iterasyon %d: En iyi maliyet = %.5f\n', it, BestCosts(it));
end

% Sonuçların Görselleştirilmesi
figure;
plot(BestCosts, 'LineWidth', 2);
xlabel('İterasyon');
ylabel('En iyi maliyet');
grid on;
title('PSO Sonucu - Sphere Fonksiyonu');
