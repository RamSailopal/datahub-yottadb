PROC(dataset)
 Q:dataset=""
 zsystem "rm /home/entrypoint/test.json"
 S FILE="/home/entrypoint/test.json"
 O FILE:(write)
 S JSON="[ { ""auditHeader"": null, ""proposedSnapshot"": { ""com.linkedin.pegasus2avro.metadata.snapshot.DatasetSnapshot"": { ""urn"": ""urn:li:dataset:(urn:li:dataPlatform:bigquery,yottadb.test_data.test,PROD)"", ""aspects"": [ { ""com.linkedin.pegasus2avro.schema.SchemaMetadata"": { ""schemaName"": ""yottadb.test_data.test"", ""platform"": ""urn:li:dataPlatform:bigquery"", ""version"": 0, ""created"": { ""time"": 1621882982738, ""actor"": ""urn:li:corpuser:etl"", ""impersonator"": null }, ""lastModified"": { ""time"": 1621882982738, ""actor"": ""urn:li:corpuser:etl"", ""impersonator"": null }, ""deleted"": null, ""dataset"": null, ""cluster"": null, ""hash"": """", ""platformSchema"": { ""com.linkedin.pegasus2avro.schema.MySqlDDL"": { ""tableSchema"": """" } }, ""fields"": ["
 Q:'$D(^META(dataset))
 S FIELD=""
 F  S FIELD=$O(^META(dataset,FIELD)) Q:FIELD=""  D
 .I $P(^META(dataset,FIELD),"*",1)="" S JSONPATH="null"
 .E  S JSONPATH="""_$P(^META(dataset,FIELD),"*",3)_"""
 .I $P(^META(dataset,FIELD),"*",3)=1 S NULLABLE="true"
 .E  S NULLABLE="false"
 .I $P(^META(dataset,FIELD),"*",6)=1 S RECURSIVE="true"
 .E  S RECURSIVE="false"  
 .I $P(^META(dataset,FIELD),"*",7)="" S GLOBALTAGS="null"
 .E  S GLOBALTAGS="""_$P(^META(dataset,FIELD),"*",7)_"""
 .I $P(^META(dataset,FIELD),"*",8)="" S GLOSSARYTERMS="null"
 .E  S GLOSSARYTERMS="""_$P(^META(dataset,FIELD),"*",8)_"""
 .S JSON=JSON_"{ ""fieldPath"": """_FIELD_""", ""jsonPath"": "_JSONPATH_", ""nullable"": "_NULLABLE_", ""description"": """_$P(^META(dataset,FIELD),"*",3)_""", ""type"": { ""type"": { ""com.linkedin.pegasus2avro.schema."_$P(^META(dataset,FIELD),"*",4)_""": {} } }, ""nativeDataType"": """_$P(^META(dataset,FIELD),"*",5)_""", ""recursive"": "_RECURSIVE_", ""globalTags"": "_GLOBALTAGS_", ""glossaryTerms"": "_GLOSSARYTERMS_" },"
 .Q
 S JSON=$E(JSON,1,$L(JSON)-1)_"], ""primaryKeys"": null, ""foreignKeysSpecs"": null } } ] } }, ""proposedDelta"": null } ]" 
 U FILE W JSON
 C FILE
 zsystem "cd /home/entrypoint && datahub ingest -c /home/entrypoint/recipe.yaml"
 Q 
