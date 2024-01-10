curl -s -H "Content-Type: application/json" -X POST \
'http://localhost:9200/_bulk?pretty' --data-binary @products.json