
echo "update.."
sudo apt-get update -y > /dev/null 2>&1
echo "upgrade"
sudo apt-get upgrade -y  > /dev/null 2>&1
echo "installation redis server"
sudo apt-get -y install redis-server > /dev/null 2>&1
echo "Démarrer Redis....:"
sudo service redis-server start
echo "Etat:"
sudo service redis-server status

echo "insertion de données statiques dans la base de données Redis...."
echo "SET profiles:BrandonAmos2  \"first : brandon, last: amos, phone:  ~(540)~947~1238, email: bamos@cs.cmu.edu, pdf: /data/cv.pdf ,src :  www.github.com/bamos/cv , url : bamos.github.io , github : bamos , twitter :brandonamos , linkedin :bdamos\"" | redis-cli
echo "affichage des données..."
echo "GET profiles:BrandonAmos2" | redis-cli

echo "insertion de données depuis le fichier yaml dans la base de données Redis...."

FILE=`cat informations.yml`
tab=( $( awk -F ":" '{print $1}' informations.yml) )
tab2=( $( awk -F ":" '{print $2}' informations.yml) )
chaine="SET profiles:tableProfile \""

length=${#tab[@]}
i=0

while [ "$i" -lt "$(($length -1))" ]
    do
        chaine="$chaine ${tab[$i]}: ${tab2[$i]},"
        ((i++))
    done
chaine="$chaine ${tab[$i]}: ${tab2[$i]} \""
echo "$chaine"
echo "$chaine "  | redis-cli
echo "affichage des données depuis la base de données...\n"

echo "GET profiles:tableProfile " | redis-cli
