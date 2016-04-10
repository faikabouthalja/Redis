echo "insertion de données statiques dans la base de données Redis...."
echo "SET profiles:BrandonAmos2  \"first : brandon, last: amos, phone:  ~(540)~947~1238, email: bamos@cs.cmu.edu, pdf: /data/cv.pdf ,src :  www.github.com/bamos/cv , url : bamos.github.io , github : bamos , twitter :brandonamos , linkedin :bdamos\"" | redis-cli
echo "affichage des données..."
echo "GET profiles:BrandonAmos2" | redis-cli
