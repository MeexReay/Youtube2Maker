# Youtube2Maker
Прога которая делает из флешки переносной ютуб 2 \
Это лишь попытка создать чтото похожее на [оригинальный ютуб 2 от Влада Кунякина](https://www.youtube.com/watch?v=Ywywiqissfg) \
Если вы хотите получить оригинальный ютуб 2, то [покупайте флешку тут](https://t.me/kunyakin/16)

## Как собрать

1. Добавьте все видео в папку `videos/` (смотреть Добавление видео)
2. Соберите сайт через `./build.sh`
3. Запишите сайт на флешку через dd (замените sdX на тот что из lsblk):
```bash
sudo dd if=build/youtube2.iso of=/dev/sdX bs=4M status=progress oflag=sync
```

## Добавление видео

### Скачать из ютуба

Установите `yt-dlp` для работы скриптов.

Скачать одно видео:

```bash
./dl-video.sh https://www.youtube.com/watch?v=<video-id>
```

Скачать плейлист:

```bash
./dl-playlist.sh https://www.youtube.com/playlist?list=<playlist-id>
```

К скриптам также можно добавлять аргументы для `yt-dlp`, например `./dl-video.sh ... --cookies-from-browser firefox` для импортирования куки-файлов из файрфокса

### Ручное добавление

1. Добавьте json файл `<video-id>.json` в папку `videos/`:
```json
{
  "name": "Название видео",
  "description": "Описание видео",
  "video-file": "<video-id>.mp4",
  "image-file": "<video-id>.png",
  "channel-name": "Название канала",
  "channel-avatar-file": "<channel-id>.png",
}
```

2. Добавьте видео файл `<video-id>.mp4` в папку `videos/`
3. Добавьте превью видео `<video-id>.png` в папку `videos/`
4. Добавьте `<channel-id>.png` в папку `videos/`

## Сжатие видео

Для сжатия всех видео в `.av1` формат, используйте эту ffmpeg команду (если у вас изначальный формат не `.mp4` то замените)

Используйте скрипт `convert-to-av1.sh`:

```bash
./convert-to-av1.sh
```

Учтите что формат видео `.av1` поддерживается не везде!