# Valera-s_Life
Console game on Ruby (Sibsutis Laboratory Work #3)

## Параметры Валеры
 - Здоровью (0; 100)
 - Мана (Алкоголь в крови) (0; 100)
 - Жизнерадостность (-10; 10)
 - Усталость (0; 100)
 - Деньги

## Возможные действия:
##### Пойти на работу (Можно только если алкоголь < 50 а усталость < 10)
- `-`5 Жизнерадостность
- `-`30 Мана (Алкоголь в крови)
- `+`$100
- `+`70 усталость
##### Созерцать природу
- `+`1 Жизнерадостность
- `-`10 Мана (Алкоголь в крови)
- `+`10 усталость
##### Пить вино и смотреть сериал
- `-`1 Жизнерадостность
- `+`30 Мана (Алкоголь в крови)
- `+`10 Усталость
- `-`5 Здоровью
- `-`$20
##### Сходить в бар:
- `+`1 Жизнерадостность
- `+`60 Мана (Алкоголь в крови)
- `+`40 Усталость
- `-`10 Здоровью
- `-`$100
##### Выпить с маргинальными личностями
-  `+`5 Жизнерадостность
-  `-`80 здоровье
- `+`90 Мана (Алкоголь в крови)
- `+`80 усталость
- `-`$150
##### Петь в метро:
- `+`1 Жизнерадостность
- `+`10 Мана (Алкоголь в крови)
- `+`$10 (еще + $50 если изначально алкоголь был > 40 & < 70)
- `+`20 усталость
##### Спать
- `+`90 здоровье если алкоголь < 30
- `-`3 Жизнерадостность если алкоголь > 70
- `-`50 Мана (Алкоголь в крови)
- `-`70 усталость
