/* Tables Created:
Patients
Services
Doctors
Staff
Treatment
Nurses
Technicians
Administrators
Administerd
Order
AdminDoctors
AdmittedPatients
*/

DROP TABLE Patients CASCADE;
DROP TABLE Employees CASCADE;
DROP TABLE Doctors CASCADE;
DROP TABLE Treatment CASCADE;
DROP TABLE Nurses CASCADE;
DROP TABLE Technicians CASCADE;
DROP TABLE AdministeredTreatment CASCADE;
DROP TABLE OrderedTreatment CASCADE;
DROP TABLE AdminDoctors CASCADE;
DROP TABLE AdmittedPatients CASCADE;
DROP TABLE Administrators CASCADE;

CREATE TABLE Patients( 
	pid char(3), 
	name varchar(20),
	insurance varchar(20), 
	Emergency_contact varchar(20),
	patient_type char(3), -- in, for Inpatient, out for Outpatient
	admitted_date date,
	discharged_date date,
	out_date date,
	PRIMARY KEY(pid)
);

CREATE TABLE Employees (
	empid char(3), 
	name varchar(20), 
	date_hire date,
	emp_type varchar(20),
	PRIMARY KEY(empid)
);


CREATE TABLE Doctors(
	empid char(3),
	name varchar(20),
	date_hire date,
	PRIMARY KEY (empid),
	FOREIGN KEY (empid) REFERENCES employees(empid)
);

CREATE TABLE Treatment(
	tid char(3),
	description varchar(20),
	treat_type char(3), -- either Inpatient or Outpatient
	PRIMARY KEY (tid)
);

CREATE TABLE Nurses(
	empid char(3),
	name varchar(20), 
	date_hire date,
	PRIMARY KEY (empid),
	FOREIGN KEY (empid) REFERENCES employees(empid)
);

CREATE TABLE Technicians(
	empid char(3),
	name varchar(20), 
	hire_date date,
	PRIMARY KEY (empid),
	FOREIGN KEY (empid) REFERENCES employees(empid)
);

CREATE TABLE Administrators(
	empid char(3),
	name varchar(20), 
	date_hire date,
	PRIMARY KEY (empid),
	FOREIGN KEY (empid) REFERENCES employees(empid)
);

CREATE TABLE AdminDoctors(
	empid char(3),
	name varchar(20), 
	date_hire date,
	PRIMARY KEY (empid),
	FOREIGN KEY (empid) REFERENCES Doctors(empid)
);

CREATE TABLE OrderedTreatment(
	orderid char(3),
	tid char(3),
	pid char(3),
	empid char(3),
	time_order date,
	PRIMARY KEY (orderid,tid, empid, pid),
	FOREIGN KEY (tid) REFERENCES Treatment(tid),
	FOREIGN KEY (empid) REFERENCES Doctors(empid),
	FOREIGN KEY (pid) REFERENCES Patients(pid)
);

CREATE TABLE AdministeredTreatment(
	orderid char(3),
	tid char(3),
	pid char(3),
	empid char(3),
	patient_type char(3),
	treat_date date,
    PRIMARY KEY (tid,empid, pid),
	FOREIGN KEY (tid) REFERENCES Treatment(tid),
	FOREIGN KEY (empid) REFERENCES employees(empid),
	FOREIGN KEY (pid) REFERENCES Patients(pid)
);

CREATE TABLE AdmittedPatients(
	pid char(3),
	empid char(3),
	admitted date NOT NULL, 
	discharged date,
	FOREIGN KEY (pid) REFERENCES Patients(pid),
	FOREIGN KEY (empid) REFERENCES AdminDoctors(empid)
);

/* Insert data */

INSERT INTO Patients VALUES
('P1','Fauziya Ado', 'Secure', 'Ado Yakasai', 'in', '2017/7/10', '2017/9/15',NULL),
('P2','Maryam Tijjani', 'Best Saver', 'Tijjani Kibiya', 'in', '2014/9/12', '2014/7/13',NULL),
('P3','Jordan Eckert', 'Best Saver', 'Eckert Micheal', 'out', NULL,NULL,'2020/04/02'),
('P4','Innocent Peace', 'Ins Health', 'Peace John', 'in', '2019/7/15', NULL,NULL),
('P5','Micheal Jackson' , 'Geico', 'Jackson Mark',  'in', '2020/7/19', '2020/8/25',NULL),
('P6','Amina Aliyu','LA Insurance', 'Aliyu Ahmad', 'out', NULL, NULL,'2019/01/07'),
('P7','Stanley Sun', 'LA Insurance', 'Sun Mark', 'out', NULL, NULL,'2017-07-10'),
('P8','Eric Jackson','EM Insurance', 'Jackson Cartman', 'out', NULL, NULL,'2018/03/09');

SELECT * FROM PATIENTS;

INSERT INTO employees VALUES
('000', 'Emma Olu','2009/4/05', 'Admin Doctor'),
('001', 'Mark George','2009/4/06', 'Admin Doctor'),
('002', 'Will Smith','2009/4/05', 'Admin Doctor'),
('003', 'Barn Rice', '2009/4/05', 'Admin Doctor'),
('004', 'Ahmad Aliyu','2009/4/05', 'Admin Doctor'),

('005', 'Ande Waquong', '2009/4/06', 'Doctor'),
('006', 'Naja Yakasai', '2009/4/05', 'Doctor'),
('007', 'Umar Yakasai', '2009/4/05', 'Doctor'),
('008', 'Greyson Smith', '2009/4/05', 'Doctor'),
('009', 'Aysha Uba', '2009/4/09', 'Doctor'),

('010', 'Oluchi Uzo', '2009/4/09', 'Administrator'),
('011', 'Love Peace', '2009/4/05', 'Administrator'),
('012', 'Jamila Mohd', '2009/4/06', 'Administrator'),
('013', 'Samuel Michael', '2009/4/05', 'Administrator'),
('014', 'King Lion', '2009/4/05', 'Administrator'),

('015', 'Queen Elizabeth', '2009/4/09', 'Nurse'),
('016', 'Salma Haruna', '2009/4/05', 'Nurse'),
('017', 'Amaka Collins', '2009/4/05', 'Nurse'),
('018', 'Hajiya Halima', '2009/4/05', 'Nurse'),
('019', 'Binta Kilishi', '2009/4/06', 'Nurse'),

('020', 'Mata Gida', '2009/4/08', 'Technician'),
('021', 'John Farm', '2009/4/05', 'Technician'),
('022', 'Umma Kilishi', '2009/4/06', 'Technician'),
('023', 'Blue Moon', '2009/4/05', 'Technician'),
('024', 'King Solomon', '2009/4/05', 'Technician')
;




INSERT INTO Doctors VALUES
('005', 'Ande Waquong', '2009/4/06'),
('006', 'Naja Yakasai', '2009/4/05'),
('007', 'Umar Yakasai', '2009/4/05'),
('008', 'Greyson Smith', '2009/4/05'),
('009', 'Aysha Uba', '2009/4/09');

INSERT INTO Doctors VALUES
('000', 'Emma Olu','2009/4/05'),
('001', 'Mark George','2009/4/06'),
('002', 'Will Smith','2009/4/05'),
('003', 'Barn Rice', '2009/4/05'),
('004', 'Ahmad Aliyu','2009/4/05');

INSERT INTO AdminDoctors VALUES
('000', 'Emma Olu','2009/4/05'),
('001', 'Mark George','2009/4/06'),
('002', 'Will Smith','2009/4/05'),
('003', 'Barn Rice', '2009/4/05'),
('004', 'Ahmad Aliyu','2009/4/05');

INSERT INTO Administrators VALUES
('010', 'Oluchi Uzo','2009/4/09'),
('011', 'Love Peace','2009/4/05'),
('012', 'Jamila Mohd','2009/4/06'),
('013', 'Samuel Michael','2009/4/05'),
('014', 'King Lion', '2009/4/05');

INSERT INTO Nurses VALUES
('015', 'Queen Elizabeth', '2009/4/09'),
('016', 'Salma Haruna', '2009/4/05'),
('017', 'Amaka Collins', '2009/4/05'),
('018', 'Hajiya Halima', '2009/4/05'),
('019', 'Binta Kilishi', '2009/4/06');

INSERT INTO Technicians VALUES
('020', 'Mata Gida','2009/4/08'),
('021', 'John Farm','2009/4/05'),
('022', 'Umma Kilishi','2009/4/06'),
('023', 'Blue Moon','2009/4/05'),
('024', 'King Solomon','2009/4/05');

INSERT INTO Treatment VALUES
('T1', 'DNA', 'in'),
('T2', 'Minor Surgery', 'in'),
('T3', 'Major Surgery', 'in'),
('T4', 'Plastic surgery', 'in'),
('T5', 'Kidney Transplant', 'in'),
('T6', 'DNA', 'in'),
('T7', 'Chemotheropy', 'in'),
('T8', 'X-Ray', 'in'),
('T9', 'ECG', 'in'),
('T10', 'ECG', 'in'),

('T11', 'Medication', 'out'),
('T12', 'Physical Therapy', 'out'),
('T13', 'pap smear', 'out'),
('T14', 'Acupunture', 'out'),
('T15', 'Injection', 'out'),
('T16', 'Drug Test', 'out'),
('T17', 'Stitches', 'out'),
('T18', 'STD Test', 'out'),
('T19', 'Pregnancy Test', 'out'),
('T20', 'Blood Test', 'out')
;

INSERT INTO OrderedTreatment VALUES
('o1', 'T1', 'P1', '000', '2020-05-13'),
('o2', 'T1', 'P1', '000', '2020-05-13'),

('o3', 'T2', 'P2', '001', '2014-06-12'),
('o4', 'T2', 'P2', '001', '2020-06-23'),

('o5', 'T4', 'P3', '002', '2018-04-02'),
('o6', 'T5', 'P3', '002', '2018-04-05'),
('o7', 'T6', 'P3', '002', '2016-04-02'),
('o8', 'T9', 'P3', '002', '2018-07-25'),

('o9', 'T9', 'P4', '003', '2017-07-16'),
('o10', 'T4', 'P4', '003', '2017-07-16'),

('o11', 'T4', 'P5', '004', '2017-07-10'),
('o12', 'T4', 'P5', '004', '2019-07-24'),

('o13', 'T11', 'P6', '005', NULL),
('o14', 'T12', 'P6', '005', NULL),

('o15', 'T17', 'P7', '006', NULL),
('o16', 'T16', 'P7', '006', NULL),

('o17', 'T20', 'P8', '007', NULL),
('o18', 'T15', 'P8', '007', NULL),
('o19', 'T20', 'P8', '007', NULL),
('o20', 'T15', 'P8', '007', NULL);


INSERT INTO AdministeredTreatment VALUES -- list multiple nurses/doctors/technicians within this table
('o1', 'T1', 'P1', '000', 'in','2020-05-13'),
('o2', 'T1', 'P1', '024', 'in','2020-05-13'),

('o3', 'T2', 'P2', '021','in', '2014-06-12'),
('o4', 'T2', 'P2', '001', 'in','2020-06-23'),

('o5', 'T4', 'P3', '019','in', '2018-04-02'),
('o6', 'T5', 'P3', '002','in', '2018-04-05'),
('o7', 'T6', 'P3', '022','in', '2016-04-02'),
('o8', 'T9', 'P3', '002', 'in','2018-07-25'),

('o9', 'T9', 'P4', '005', 'in','2017-07-16'),
('o10', 'T4', 'P4', '005', 'in','2017-07-16'),

('o11', 'T4', 'P5', '006', 'in','2017-07-10'),
('o12', 'T4', 'P5', '004', 'in','2019-07-24'),

('o13', 'T11', 'P6', '020','out', '2017-07-10'),
('o14', 'T12', 'P6', '005','out','2018-07-10'),

('o15', 'T17', 'P7', '006','out','2020-07-10'),
('o16', 'T16', 'P7', '006','out', '2019-07-10'),

('o17', 'T20', 'P8', '007','out','2016-07-10'),
('o18', 'T15', 'P8', '018', 'out','2018-07-01'),
('o19', 'T20', 'P8', '002','out', '2019-07-01'),
('o20', 'T15', 'P8', '017','out', '2020-06-22');

INSERT INTO AdmittedPatients VALUES -- list multiple did to account for multiple hospital visits
('P1', '000', '2018/9/18', '2018/9/19'),
('P1', '000', '2019/11/5', '2019/11/7'),
('P1', '000', '2016/12/9', '2016/12/15'),
('P1', '000', '2017/1/13', '2017/1/15'),

('P2', '001', '2016/2/21', '2016/2/22'),
('P2', '001', '2015/3/25', '2015/3/27'),
('P2', '001', '2019/9/9', '2019/9/17'),
('P2', '001', '2015/2/12', '2015/2/19'),


('P3', '002', '2017/12/1', '2018/2/1'),
('P3', '002', '2020/4/7', '2020/4/19'),
('P4', '002', '2018/7/1', NULL),

('P5', '003', '2016/2/1', '2016/2/13'),
('P5', '003', '2017/4/12', '2017/5/15'),
('P6', '003', '2018/7/15', NULL),

('P7', '004', '2019/5/19', '2019/6/22'),
('P7', '004', '2020/3/2', '2020/7/5')
;




/* Queries

A. Patient Information
1. List all patients currently admitted to the hospital
(i.e., those who are currently receiving inpatient services). 
List only patient identification number and name.*/

select pid,name from patients 
where admitted_date is Not Null and discharged_date is NULL;


/* 2. List all patients who have received outptient services within a given date range. List only patient
identification number and name. */
select pid, name from patients
where out_date is not null;


/*3.For a given patient (either patient identification number or name),list all treatments that
were administered.Group Treatments by admissions. List admissions in descending chrinological order, 
and list treattments in ascending chronological order within each admission.*/

Select A.pid,A.tid,A.treat_date, T.description
from AdministeredTreatment A join Treatment T using(tid) 
Group by pid,treat_date
order by treat_date desc; 


/*
B.Diagonosis and Treatment
1. List the treatments performed at the hospital (to both inpatients and outpatients), 
in descending order of occurrences. 
List treatment identification number, name, and total number of occurrences of each treatment */


select tid, description, count(*)
from administeredtreatment
join Treatment using (tid)
group by tid, description
order by count(*) desc;

/* 2.  For a given treatment occurrence, list all the hospital employees that were involved. Also
include the patient name and the doctor who ordered the treatment. */

select treatment.description as "Treatment", 
employees.emp_type as "Position", employees.name as "Employees Involved", 
patients.name as "Patient"
from administeredtreatment
join treatment using (tid)
join employees using (empid)
join patients using (pid);


/*
C. Employee Information
1. For a given doctor, list all treatments that they ordered in descending order of occurrence. 
For each treatment, list the total number of occurrences for the given doctor.*/


select tid,description, count(*) from Treatment
left outer join OrderedTreatment o using (tid)
where empid Between '000' and '009'
group by tid, description
order by count(*) desc;

/*2. List employees who have been involved in the treatment of every admitted patient.*/
select E.empid,E.name as "Employee Involved", E.emp_type, A.pid
from employees E join administeredtreatment A using(empid)
where pid IN(select pid from admittedpatients);

/*3. List the primary doctors of patients with a high admission rate 
(at least 4 admissions within a one-year time frame).
*/

select distinct name as "Primary Doctor" from admittedpatients
join doctors using (empid)
where admitted > now() - interval '1 year'
group by name
having count(*) >= 4;

/* The way I created by data No doctor has amission rate within the given range */

