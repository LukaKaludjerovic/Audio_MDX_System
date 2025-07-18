# Audio MDX System

Data Warehouse system implemented for MySQL server, Mondrian Schema Workbench, and Kettle (Spoon) tools.

# How to start the system
* Create operating database by using `operativna-struktura.sql` script
* Fill operating database by using `operativna-podaci.sql` script
* Create data warehouse database by using `skladiste-struktura.sql` script
* Fill data warehouse by using Kettle (Spoon) and scripts found in `./punjenje/totalno punjenje` folder
* (optional) Fill operating database with additional data by using `operativna-podaci-dodatno.sql` script
* (optional) Fill data warehouse with additional data by using scripts found in `./punjenje/inkrementalno punjenje` folder
* Run MDX queries in Mondrian Schema Workbench using schema `skladiste.xml`
* Example of MDX queries are found in `upiti-mdx.txt` file
