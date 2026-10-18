
class Patient{final String name,ailment;final int age;const Patient(this.name,this.age,this.ailment);}
class Appointment{final Patient patient;String status;Appointment(this.patient,[this.status='Waiting']);}
class Medicine{final String name;final int stock,price;const Medicine(this.name,this.stock,this.price);bool get low=>stock<=10;}
final patients=[Patient('Funke Adeyemi',34,'Malaria test'),Patient('Peter Obi',52,'Blood pressure review'),Patient('Aisha Bello',27,'Antenatal visit')];
final queue=[Appointment(patients[0]),Appointment(patients[1],'In consultation'),Appointment(patients[2])];
final meds=[Medicine('Paracetamol 500mg',120,500),Medicine('Artemether injection',8,3500),Medicine('Amoxicillin 250mg',45,1200)];
int bill({int consult=5000,int drugs=0,int lab=0})=>consult+drugs+lab;
String nextStatus(String s)=>s=='Waiting'?'In consultation':s=='In consultation'?'Done':'Done';
