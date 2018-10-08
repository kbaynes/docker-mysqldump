#!/bin/bash

echo DIR: $DIR
echo NAME: $NAME
echo BUCKET: $BUCKET
echo END_POINT: $END_POINT

NOW=`date +%Y-%m-%d-%H-%M`
FILENAME=$NOW.tar.gz
ERRORFILE=$DB_NAME.$NOW.error.log



# creates $FILENAME.gz
# gzip /tmp/$FILENAME
tar -zcvf /tmp/$NOW $DIR 

# ensure the bucket is present
aws s3 mb s3://$BUCKET --region us-east-1 --endpoint-url $END_POINT

aws s3 cp /tmp/$FILENAME.gz s3://$BUCKET/dir/$NAME/$FILENAME --endpoint-url $END_POINT


aws s3 ls s3://$BUCKET/mysql-dump/$NAME/$FILENAME --endpoint-url $END_POINT


/bin/rm -f /tmp/$FILENAME
