import app from 'firebase/app'
import 'firebase/auth'
import 'firebase/storage'

const config = {
    apiKey: "AIzaSyBAM-ya5n2qG0HrIxrL8bZ9owLUoTqdNMo",
    authDomain: "ecommercepracticeapp.firebaseapp.com",
    databaseURL: "https://ecommercepracticeapp.firebaseio.com",
    projectId: "ecommercepracticeapp",
    storageBucket: "ecommercepracticeapp.appspot.com",
    messagingSenderId: "651076237994"
}

app.initializeApp(config)

export default app;