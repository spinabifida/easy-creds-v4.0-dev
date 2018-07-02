while read p;
do
curl -L -s $p | tr ' ' '\n' |sed $'s/[^[:print:]\t]//g' |sed "s/[^a-z|0-9]//g;" | sort -u | pw-inspector -m 4 -M 20 >> all.words ;
done<url.txt ;

cat all.words | sort -u > "webcrawl.$(date +%F_%R)" ;
rm -f all.words ;
