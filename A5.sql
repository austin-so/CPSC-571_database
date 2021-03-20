DROP DATABASE IF EXISTS `insurance`;
CREATE DATABASE `insurance`;
USE `insurance`;

/*Creating table for elememts*/
/*create element table for agent_broker, part of original specification*/
CREATE TABLE `Agent_broker`(
	`agentID` INTEGER,
	`phone_no` char (50),
    `name` char (50),
    `email` char (50),
    PRIMARY KEY (`agentID`)
);

/*insert values for agent_broker*/
INSERT `Agent_broker` VALUES (000000, '8888888888', 'john doe', 'john@email.com');
INSERT `Agent_broker` VALUES (000001, '7777777777', 'john doe2', 'john2@email.com');
INSERT `Agent_broker` VALUES (000002, '9999999999', 'john doe3', 'john3@email.com');


/*create element table for insurance, part of original specification*/
CREATE TABLE `insurance`(
	`policy_no` INTEGER,
	`type` char (50),
    `limit` char (10),
    `expiration_date` char (50),
    PRIMARY KEY (`policy_no`)
);

/*insert values for insurance*/
INSERT `insurance` VALUES (111111, 'home insurance', '2000000', '10/22/2022');
INSERT `insurance` VALUES (222222, 'auto insurance', '1000000', '10/11/2022');
INSERT `insurance` VALUES (000000, 'life insurance', '5000000', '10/01/2022');

/*create element table for house*/
CREATE TABLE `house`(
	`address` char (64),
	`year` INTEGER,
    `market_value` INTEGER,
    `size` INTEGER,
    PRIMARY KEY (`address`)
);

/*insert values for house*/
INSERT `house` VALUES ('100 address NE', 2009, 2000000, '3000');
INSERT `house` VALUES ('200 address NW', 2019, 1000000, '40002');
INSERT `house` VALUES ('300 address SW', 2020, 400000, '2212');

/*create element table for customer, part of original specification*/
CREATE TABLE `customer`(
	`customerID` INTEGER,
	`driver_licences` char (50),
    `name` char (50),
    `age` INTEGER,
    `income` INTEGER,
    PRIMARY KEY (`customerID`)
);

/*insert values for customer*/
INSERT `customer` VALUES (000000, 'R111111', 'john doe', 25, 30000);
INSERT `customer` VALUES (000001, 'A222222', 'jane doe', 23, 40000);
INSERT `customer` VALUES (000002, 'B333333', 'alex doe', 40, 100000);

/*create element table for car, part of original specification*/
CREATE TABLE `car`(
	`licence_plate` char (50),
	`model` char (50),
    `make` char (50),
    `year` INTEGER ,
    PRIMARY KEY (`licence_plate`)
);

/*insert values for car*/
INSERT `car` VALUES ('sx 2158', 'fard', 'focus', 2012);
INSERT `car` VALUES ('ac 3255', 'toyota', 'camry', 2003);
INSERT `car` VALUES ('ae 3650', 'benz', 'c350', 2018);

/*creating ralational table */

/*create relational table for customer owns car, part of original specification*/
CREATE TABLE `owns`(
	`licence_plate` char (50),
	`customerID` INTEGER,
    primary key(`licence_plate`,`customerID`),
	foreign key(`licence_plate`) references `car` (`licence_plate`),
    foreign key(`customerID`) references `customer` (`customerID`)
);

/*insert values for car*/
INSERT `owns` VALUES ('sx 2158', 000000);
INSERT `owns` VALUES ('ac 3255', 000002);
INSERT `owns` VALUES ('ae 3650', 000001);

/*create relational table for agent manages customer, part of original specification*/
CREATE TABLE `manages`(
	`agentID` INTEGER,
	`customerID` INTEGER,
    primary key(`agentID`,`customerID`),
	foreign key(`agentID`) references `agent_broker` (`agentID`),
    foreign key(`customerID`) references `customer` (`customerID`)
);

/*insert values for manages*/
INSERT `manages` VALUES (000000, 000002);
INSERT `manages` VALUES (000001, 000001);
INSERT `manages` VALUES (000002, 000000);

/*create relational table for agent provides insurance*/
CREATE TABLE `provide_by`(
	`policy_no` INTEGER,
	`agentID` INTEGER,
    primary key(`policy_no`,`agentID`),
	foreign key(`policy_no`) references `insurance` (`policy_no`),
    foreign key(`agentID`) references `agent_broker` (`agentID`)
);

/*insert values for manages*/
INSERT `provide_by` VALUES (000000, 000002);
INSERT `provide_by` VALUES (111111, 000001);
INSERT `provide_by` VALUES (222222, 000000);

/*create relational table for customer buy insurance*/
CREATE TABLE `bought_by`(
	`policy_no` INTEGER,
	`customerID` INTEGER,
    primary key(`policy_no`,`customerID`),
	foreign key(`policy_no`) references `insurance` (`policy_no`),
    foreign key(`customerID`) references `customer` (`customerID`)
);

/*insert values for manages*/
INSERT `bought_by` VALUES (000000, 000002);
INSERT `bought_by` VALUES (111111, 000001);
INSERT `bought_by` VALUES (222222, 000000);

/*create relational table for customer owns house*/
CREATE TABLE `owns_house`(
	`customerID` INTEGER,
	`address` char (64),
    primary key(`address`,`customerID`),
	foreign key(`address`) references `house` (`address`),
    foreign key(`customerID`) references `customer` (`customerID`)
);

/*insert values for owns_house*/
INSERT `owns_house` VALUES (000000, '100 address NE');
INSERT `owns_house` VALUES (000001, '200 address NW');
INSERT `owns_house` VALUES (000002, '300 address SW');