

1.complex query on pendingservice:

SELECT "RECORD"."OID" AS ordernumber , "SERVICES"."SERVICE_NAME" AS service,("SERVICE_PROVIDER"."FIRST_NAME" ||' '|| "SERVICE_PROVIDER"."LAST_NAME") AS worker ,"RECORD"."START_TIME" AS start_time
FROM "RECORD" JOIN "ORDER" ON "RECORD"."OID"="ORDER"."OID" 
JOIN "SERVICE_PROVIDER" ON "SERVICE_PROVIDER"."PHONE"="ORDER"."SERVICE_PROVIDER"
JOIN "SERVICES" ON "ORDER"."SERVICE_ID"="SERVICES"."SERVICE_ID" 
WHERE "RECORD"."OID" IN ( SELECT "OID" FROM "RECORD" WHERE "USER_ID"=1733202506);




2.complex query on worker

SELECT ("SERVICE_PROVIDER"."FIRST_NAME"||' '||"SERVICE_PROVIDER"."LAST_NAME") AS FULLNAME,
"SERVICE_PROVIDER"."PHONE" AS PHONE,"SERVICE_PROVIDER"."RATING" AS RATING,"SERVICES"."COST" AS PRICE,"LOCATION"."LATITUDE" AS LAT,"LOCATION"."LONGITUDE" AS LON
FROM "SERVICES" JOIN  "SERVICE_PROVIDER" ON ("SERVICES"."SERVICE_SUBCATEGORY"="SERVICE_PROVIDER"."SERVICE_SUBCATEGORY")
JOIN "LOCATION" ON ( "SERVICE_PROVIDER"."LOCATION_ID"="LOCATION"."LOCATION_ID")
WHERE "SERVICES"."SERVICE_NAME"='Washing Machine' AND "SERVICE_PROVIDER"."IS_IDLE"=true;



3.complex query on providerviewrequet

SELECT "ORDER"."OID" AS ORDERID,("USER"."FIRST_NAME"||' '||"USER"."LAST_NAME") AS USERNAME,
"USER"."PHONE" AS PHONE,"SERVICES"."SERVICE_NAME" AS SERVICE,"ORDER"."COST" AS PRICE,
"LOCATION"."NAME" AS ADDRESS
FROM "ORDER" JOIN "USER" ON ("ORDER"."USER_ID"="USER"."PHONE" )
JOIN "SERVICES" ON ( "ORDER"."SERVICE_ID"="SERVICES"."SERVICE_ID") 
JOIN "LOCATION" ON ("ORDER"."USER_LOCATION"="LOCATION"."LOCATION_ID")
WHERE "ORDER"."SERVICE_PROVIDER"=1736598989 AND "ORDER"."IS_ACCEPTED" IS NULL;


4. -- SELECT CANCEL ORDER TO USER WINDOW
--SELECT CANCEL ORDER TO USER WINDOW
SELECT "ORDER"."OID" AS OID,"SERVICES"."SERVICE_NAME" AS SERVICE,
"SERVICE_PROVIDER"."FIRST_NAME"||' '||"SERVICE_PROVIDER"."LAST_NAME" AS PROVIDER_NAME
FROM "ORDER" JOIN "SERVICES" ON "ORDER"."SERVICE_ID"="SERVICES"."SERVICE_ID"
JOIN "SERVICE_PROVIDER" ON "SERVICE_PROVIDER"."PHONE"="ORDER"."SERVICE_PROVIDER"
WHERE "ORDER"."USER_ID"=1733202506 AND "ORDER"."IS_ACCEPTED"=false;


5. --COMPLEX QUERY ON FINDING SERVICE PROCESSING

SELECT "ORDER"."OID" AS OID,"SERVICES"."SERVICE_NAME" AS SERVICE,
"SERVICE_PROVIDER"."FIRST_NAME"||' '||"SERVICE_PROVIDER"."LAST_NAME" AS PROVIDER_NAME
FROM "ORDER" JOIN "SERVICES" ON "ORDER"."SERVICE_ID"="SERVICES"."SERVICE_ID"
JOIN "SERVICE_PROVIDER" ON "SERVICE_PROVIDER"."PHONE"="ORDER"."SERVICE_PROVIDER"
WHERE "ORDER"."USER_ID"=1733202506 AND "ORDER"."IS_ACCEPTED" IS NULL;