<?php

namespace Database\Seeders;

use App\Models\Time;
use Illuminate\Database\Seeder;

class TimeSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        Time::create(['nome' => 'América-MG', 'urlEscudo' => 'https://logodetimes.com/times/america-mineiro/logo-america-mineiro-256.png']);
        Time::create(['nome' => 'Atlético-MG', 'urlEscudo' => 'https://logodetimes.com/times/atletico-mineiro/logo-atletico-mineiro-256.png']);
        Time::create(['nome' => 'Athletico-PR', 'urlEscudo' => 'https://logodetimes.com/times/atletico-paranaense/logo-atletico-paranaense-256.png']);
        Time::create(['nome' => 'Bahia', 'urlEscudo' => 'https://logodetimes.com/times/bahia/logo-bahia-256.png']);
        Time::create(['nome' => 'Botafogo', 'urlEscudo' => 'https://logodetimes.com/times/botafogo/logo-botafogo-256.png']);
        Time::create(['nome' => 'Corinthians', 'urlEscudo' => 'https://logodetimes.com/times/corinthians/logo-corinthians-256.png']);
        Time::create(['nome' => 'Coritiba', 'urlEscudo' => 'https://logodetimes.com/times/coritiba/logo-coritiba-256.png']);
        Time::create(['nome' => 'Cruzeiro', 'urlEscudo' => 'https://logodetimes.com/times/cruzeiro/logo-cruzeiro-256.png']);
        Time::create(['nome' => 'Cuiabá', 'urlEscudo' => 'https://logodetimes.com/times/cuiaba/logo-cuiaba-256.png']);
        Time::create(['nome' => 'Flamengo', 'urlEscudo' => 'https://logodetimes.com/times/flamengo/logo-flamengo-256.png']);
        Time::create(['nome' => 'Fluminense', 'urlEscudo' => 'https://logodetimes.com/times/fluminense/logo-fluminense-256.png']);
        Time::create(['nome' => 'Fortaleza', 'urlEscudo' => 'https://logodetimes.com/times/fortaleza/logo-fortaleza-256.png']);
        Time::create(['nome' => 'Goiás', 'urlEscudo' => 'https://logodetimes.com/times/goias/logo-goias-esporte-clube-256.png']);
        Time::create(['nome' => 'Grêmio', 'urlEscudo' => 'https://logodetimes.com/times/gremio/logo-gremio-256.png']);
        Time::create(['nome' => 'Internacional', 'urlEscudo' => 'https://logodetimes.com/times/internacional/logo-internacional-256.png']);
        Time::create(['nome' => 'Palmeiras', 'urlEscudo' => 'https://logodetimes.com/times/palmeiras/logo-palmeiras-256.png']);
        Time::create(['nome' => 'Bragantino', 'urlEscudo' => 'https://logodetimes.com/times/red-bull-bragantino/logo-red-bull-bragantino-256.png']);
        Time::create(['nome' => 'Santos', 'urlEscudo' => 'https://logodetimes.com/times/santos/logo-santos-256.png']);
        Time::create(['nome' => 'São Paulo', 'urlEscudo' => 'https://logodetimes.com/times/sao-paulo/logo-sao-paulo-256.png']);
        Time::create(['nome' => 'Vasco da Gama', 'urlEscudo' => 'https://logodetimes.com/times/vasco-da-gama/logo-vasco-da-gama-256.png']);
    }
}
