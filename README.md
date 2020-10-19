# Hospital-Database
This is the end of semester project of the course database management system 1 at Auburn University- Summer(2020)

Problem Description
A new hospital is being constructed to service the needs of a rapidly growing
retirement community. You have been contracted to develop the database
system that will manage the primary care operation of the hospital, but not
the financial operation.

Basic rules and operational procedures are described below:

• The hospital is stated by many types of employees including doctors,
nurses, technicians, and administrators.

• All doctors who work for the hospital have consulting privileges, which
allow them to be assigned to patients, and order treatments for patients.
Some, but not all, doctors also have admitting privileges, which allow
them to admit patients to the hospital.

• The hospital provides both inpatient and outpatient services. Outpa-
tient services must be ordered by a doctor with consulting privileges.
Inpatient services require a hospital stay and are thus only available to
patients who are admitted to the hospital.

• When a patient is admitted to the hospital by a doctor, he or she is
given a unique patient identification number by an administrative em-
ployee. Each patient must provide an emergency contact and insurance
policy information at the time of admission.

• The doctor who admits a patient is considered that patient's primary
doctor. Only that doctor can order and perform treatments for that
patient.

• Treatments include both procedures and medication. All treatments
must be ordered by a doctor and administered by an appropriate hos-
pital employee. Treatments may be ordered for patients on either an
inpatient or outpatient basis. A timestamp is associated with the order
and all administrations.

• Treatments are administered to patients by one or more employees who
are either doctors, nurses, or technicians.

• When an admitted patient's primary doctor decides that the necessary
course of treatment has ended, that patient is discharged from the
hospital by an administrative employee.
