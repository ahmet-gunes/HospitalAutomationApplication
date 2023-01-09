import express from 'express'
import { getDoctor, getDoctors, getPatient, getPatients} from './database.js'

const app = express()

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




