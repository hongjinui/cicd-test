config = {
  _id : "replicaSet",
  members: [
    {_id:0,host : "mongors1:27017"},
    {_id:1,host : "mongors2:27017"},
    {_id:2,host : "mongors3:27017"},
  ]
}

rs.initiate(config);

rs.conf();
