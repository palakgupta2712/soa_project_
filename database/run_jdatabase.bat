title jdatabase

:: Change your project dirictory here
set working_dir=E:\bank_soa

@echo off
cls
echo - Compiling jdatabase package
echo:
javac -cp "json-simple-1.1.1.jar";"mysql-connector-java-8.0.18.jar"; jdatabase\*.java > run_jdatabase.log 2>&1
echo - Done

echo:
echo - Making jdatabase.jar
echo:
jar cvf jdatabase.jar ./jdatabase/*.class json-simple-1.1.1.jar mysql-connector-java-8.0.18.jar >> run_jdatabase.log 2>&1
echo - Done

echo:
echo - Installing mysql-connector-java-8.0.18.jar
echo:
call mvn install:install-file -Dfile=%working_dir%\database\mysql-connector-java-8.0.18.jar -DgroupId=mysql -DartifactId=mysql-connector-java -Dversion=8.0.18 -Dpackaging=jar -DgeneratePom=true >> run_jdatabase.log 2>&1
echo - Done

echo:
echo - Installing json-simple-1.1.1.jar
echo:
call mvn install:install-file -Dfile=%working_dir%\database\json-simple-1.1.1.jar -DgroupId=com.googlecode.json-simple -DartifactId=json-simple -Dversion=1.1.1 -Dpackaging=jar -DgeneratePom=true >> run_jdatabase.log 2>&1
echo - Done

echo:
echo - Installing jdatabase.jar
echo:
call mvn install:install-file -Dfile=%working_dir%\database\jdatabase.jar -DgroupId=mysql -DartifactId=jdatabase -Dversion=1.0 -Dpackaging=jar -DgeneratePom=true >> run_jdatabase.log 2>&1
echo - Done

echo:
echo ------------------------------
echo - Testing jdatabase connection
echo ------------------------------
timeout 2 > nul
echo:
java -cp "json-simple-1.1.1.jar";"mysql-connector-java-8.0.18.jar"; jdatabase.dbsql
echo - Done
echo:
pause
