echo "Updating $1 file"

echo "Setting -Xms256m"
sed -e "s/-Xms128m/-Xms256m/" $1 > /tmp/idea64.vmoptions
cp /tmp/idea64.vmoptions $1

echo "Setting -Xmx750m"
sed -e "s/-Xmx750m/-Xmx5000m/" $1 > /tmp/idea64.vmoptions
cp /tmp/idea64.vmoptions $1
