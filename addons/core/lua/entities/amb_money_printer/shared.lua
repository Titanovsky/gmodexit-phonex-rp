ENT.Type        = 'anim'

ENT.PrintName   = 'Денежный Принтер'
ENT.Author      = '[ Ambition ]'
ENT.Category    = '[ AMB ] DarkRP'
ENT.Spawnable   = true

ENT.Chunks = {
    { name = 'Speed', header = 'Уменьшить время печати', price = 80, max = 6, count = -5 },
    { name = 'Charge', header = 'Уменьшить расход батарейки', price = 400, max = 6, count = -1 },
    { name = 'Money', header = 'Увеличить оборот Долларов', price = 200, max = 5, count = 100 },
    { name = 'PhonexCoins', header = 'Увеличить оборот PhonexCoins', price = 850, max = 6, count = .002 },
    { name = 'Battery', spec = true, header = 'Пополнить батарейку', price = 100, max = 500, count = 50 },
    { name = 'Health', spec = true, header = 'Починить принтер', price = 250, max = 2000, count = 100 },
    { name = 'Cooler', spec = true, header = 'Установить кулер', price = 600, max = 1, count = 1 }
}
