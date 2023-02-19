while read youtubeurl
do
    echo ${youtubeurl}
    youtube-dl \
	--extract-audio \
	--audio-format wav \
	--write-sub \
	--sub-format vtt \
	--sub-lang ja \
	--prefer-ffmpeg \
	--output "new/raw/%(id)s.16k.%(ext)s" \
	--rm-cache-dir \
	--postprocessor-args "-ac 1 -ar 16000 -loglevel quiet" \
	"${youtubeurl}"
    sleep 10
done < data/more.txt
