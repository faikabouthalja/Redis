echo "insertion de données statiques dans la base de données Redis...."
echo "SET profiles:BrandonAmos2  \"first : brandon, last: amos, phone:  ~(540)~947~1238, email: bamos@cs.cmu.edu, pdf: /data/cv.pdf ,src :  www.github.com/bamos/cv , url : bamos.github.io , github : bamos , twitter :brandonamos , linkedin :bdamos\"" | redis-cli
echo "affichage des données..."
echo "GET profiles:BrandonAmos2" | redis-cli

FILE=`cat informations.yml`
tab=( $( awk -F ":" '{print $0}' informations.yml) )
tab2=( $( awk -F ":" '{print $2}' informations.yml) )
chaine="SET profiles:FaikaBouthalja \""

length=${#tab[@]}
i=0

while [ "$i" -lt "$(($length -1))" ]
    do
        chaine="$chaine ${tab[$i]} ${tab2[$i]},"
        ((i++))
    done
chaine="$chaine ${tab[$i]} ${tab2[$i]}"

chaine="$chaine ${tab[${#tab[@]}-1]} ${tab2[${#tab2[@]}-1]} \" "
echo "$chaine "  | redis-cli
echo "GET profiles:FaikaBouthalja " | redis-cli

