-- feat/create-database-veterinary
CREATE DATABASE veterinary;

-- feat/create-table-owners
CREATE TABLE owners(
	ownerid INT PRIMARY KEY,
	ofirstname VARCHAR(50) NOT NULL,
	olastname VARCHAR(50) NOT NULL,
	address VARCHAR(100) NOT NULL,
	email VARCHAR(100) NOT NULL,
	phone VARCHAR(50) NOT NULL
);

-- feat/create-table-animals
CREATE TABLE animals(
	animalid INT PRIMARY KEY,
	name VARCHAR(50) NOT NULL,
	species VARCHAR(50) NOT NULL,
	breed VARCHAR(50) NOT NULL,
	dateofbirth DATE,
	gender VARCHAR(10) NOT NULL,
	color VARCHAR(50) NOT NULL,
	ownerid INT,
	foreign key (ownerid) references owners(ownerid)
);

-- feat/create-table-appointments
CREATE TABLE appointments(
	appointid INT PRIMARY KEY,
	appointdate DATE,
	reason VARCHAR(255) NOT NULL,
	animalid INT,
	foreign key (animalid) references animals(animalid)
);

-- feat/create-table-doctors
CREATE TABLE doctors(
	doctorid INT PRIMARY KEY,
	dfirstname VARCHAR(50) NOT NULL,
	dlastname VARCHAR(50) NOT NULL,
	specialty VARCHAR(100) NOT NULL,
	phone VARCHAR(15) NOT NULL,
	email VARCHAR(100) NOT NULL
);

-- feat/create-table-invoices
CREATE TABLE invoices(
	invoiceid INT PRIMARY KEY,
	paymentdate TIME,
	totalamount NUMERIC(10,2) NOT NULL,
	appointid INT,
	foreign key (appointid) references appointments(appointid)
);

-- feat/create-table-medicalrecords
CREATE TABLE medicalrecords(
	recordid INT PRIMARY KEY,
	recorddate TIMESTAMP,
	diagnosis VARCHAR(1000) NOT NULL,
	prescription VARCHAR(2000) NOT NULL,
	notes VARCHAR(2000) NOT NULL,
	animalid INT,
	doctorid INT,
	foreign key (animalid) references animals(animalid),
	foreign key (doctorid) references doctors(doctorid)
);