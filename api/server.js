import express from 'express'
import { getDoctor, getDoctors, getPatient, getPatients, setDoctor, setPatient} from './database.js'

const app = express()
app.use(express.json())

app.listen(8080, () => {
    console.log('server is running on port 8080')
})

app.use((err, req, res, next) => {
    console.error(err.stack)
    res.status(500).send('Something broke!')
})

app.get("/doctors",async (req, res)=>{
    const doctors = await getDoctors()
    res.send(doctors)
})

app.get("/patients",async (req, res)=>{
    const patients = await getPatients()
    res.send(patients)
})

app.post("/doctor", async(req, res) =>{
    const {doctorName, doctorMail, doctorPassword, doctorPhoto, doctorGender, doctorDiscipline, doctorMastery1, doctorMastery2, 
        doctorMastery3, doctorGraduate, doctorWorkplace, doctorOnline} = req.body;
    const doctor = await setDoctor(doctorName, doctorMail, doctorPassword, doctorPhoto, doctorGender, doctorDiscipline, doctorMastery1, doctorMastery2, 
        doctorMastery3, doctorGraduate, doctorWorkplace, doctorOnline);
        res.send(doctor)
})

app.post("/patient", async(req, res) =>{
    const {PatientName, PatientMail, PatientPassword, PatientPhoto, PatientGender, PatientOnline} = req.body;
    const patient = await setPatient(PatientName, PatientMail, PatientPassword, PatientPhoto, PatientGender, PatientOnline);
        res.send(patient)
})



