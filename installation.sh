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
