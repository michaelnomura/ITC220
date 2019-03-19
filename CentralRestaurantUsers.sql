GRANT ALL PRIVILEGES ON *.* TO 'DBA'@'localhost' IDENTIFIED BY PASSWORD '*98F19B394B58FAC4B01A3D9037B93CA2A17199CF' WITH GRANT OPTION;

GRANT ALL PRIVILEGES ON `CentralRestaurant`.* TO 'DBA'@'localhost';

GRANT USAGE ON *.* TO 'Employees'@'localhost' IDENTIFIED BY PASSWORD '*A41BEE51488264C01B96DE959A9142AF1A75205E';

GRANT ALL PRIVILEGES ON `CentralRestaurant`.* TO 'Employees'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`TableOrders` TO 'Employees'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`Menu` TO 'Employees'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Orders` TO 'Employees'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`SupplyOrders` TO 'Employees'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`Discounts` TO 'Employees'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Tables` TO 'Employees'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`Supplies` TO 'Employees'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`Vendors` TO 'Employees'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`SupplyOrderDetails` TO 'Employees'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`DishTypes` TO 'Employees'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Dishes` TO 'Employees'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`OrderDetails` TO 'Employees'@'localhost';

GRANT USAGE ON *.* TO 'Managers'@'localhost' IDENTIFIED BY PASSWORD '*74445CD742AF268FD22866DA0D12758951D638F7';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`SupplyOrders` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Discounts` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Menu` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Dishes` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Vendors` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Orders` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`DishTypes` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`OrderDetails` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`SupplyOrderDetails` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Tables` TO 'Managers'@'localhost';


GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Supplies` TO 'Managers'@'localhost';


GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`Employees` TO 'Managers'@'localhost';

GRANT SELECT, INSERT, UPDATE, REFERENCES ON `CentralRestaurant`.`EmployeeRoles` TO 'Managers'@'localhost';

GRANT USAGE ON *.* TO 'Vendors'@'localhost' IDENTIFIED BY PASSWORD '*AA5F498BEE9D8E3A091610F6B4456E1A09763C27';

GRANT ALL PRIVILEGES ON `CentralRestaurant`.* TO 'Vendors'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`Supplies` TO 'Vendors'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`SupplyOrderDetails` TO 'Vendors'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`SupplyOrders` TO 'Vendors'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`OrderDetails` TO 'Vendors'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`Orders` TO 'Vendors'@'localhost';

GRANT SELECT, REFERENCES ON `CentralRestaurant`.`Menu` TO  'Vendors'@'localhost';
