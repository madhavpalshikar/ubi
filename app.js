const config = require("./config");
const jwt = require("jsonwebtoken");
const express = require("express");
const mysql = require("mysql");
const app = express();

const db = mysql.createConnection({
    host:'localhost',
    database: 'ubi',
    user: 'root',
    password: ''
})

app.use(express.json());
app.use(express.urlencoded({extended: true}));

let validateToken = (req, res, next) => {
    let token = req.headers['authorization'];
    if(token){
        token = token.slice(7, token.length);
    }

    if(token){
        jwt.verify(token, config.secret, (err, data)=>{
            if(err){
                res.status(403).json({
                    status: false,
                    message: "Invalid auth token"
                });
            }
            else{
                req.rqdata = data;
                next();
            }
        })
    }
    else{
        res.status(400).json({status: false, message: "Auth Token is missing."});
    }
};

app.post('/accessToken',(req,res)=>{
    if(req.body.username && req.body.password){
        if(req.body.username="ubisoft" && req.body.password=="ubisoft"){
            let token = jwt.sign({username: req.body.username}, config.secret,{expiresIn: '1hr'});
            res.status(200).json({
                success: true,
                token: token,
                message: "Authentication successfull"
            })
        }
        else{
            res.status(403).json({
                success: false,
                message: "incorrect details"
            })
        }
    }
    else{
        res.status(400).json({
            status:false,
            message: "Authentication failed."
        })
    }
});

app.use(validateToken);

app.get('/LeaderBoard',(req,res)=>{
    db.query(`SELECT id, kills, points, FIND_IN_SET( points, (
        SELECT GROUP_CONCAT( DISTINCT points
        ORDER BY points DESC ) FROM leaderboard WHERE matchTitle = "${req.query.match}")
        ) AS rank
        FROM leaderboard WHERE matchTitle = "${req.query.match}" ORDER BY rank`,(err, result)=>{
        if(err){
            res.status(400).json(err);
        }
        res.status(200).json(result);
    });
});

app.get('/LeaderBoard/:id',(req,res)=>{
    db.query(`SELECT id, kills, points, FIND_IN_SET( points, (
        SELECT GROUP_CONCAT( DISTINCT points
        ORDER BY points DESC ) FROM leaderboard WHERE gameID=${req.params.id} AND matchTitle = "${req.query.match}")
        ) AS rank
        FROM leaderboard WHERE gameID=${req.params.id} AND matchTitle = "${req.query.match}" ORDER BY rank`,(err, result)=>{
        if(err){
            res.status(400).json(err);
        }
        res.status(200).json(result);
    });
});

app.get('/PlayerStats/:id',(req, res)=>{
    db.query(`SELECT id, kills, points FROM leaderboard WHERE userID=${req.params.id}`,(err, result)=>{
        if(err){
            res.status(400).json(err);
        }
        res.status(200).json(result);
    });
});

app.get('/PlayerStats',(req,res)=>{
    db.query(`SELECT id, kills, points FROM leaderboard WHERE matchTitle = "${req.query.match}"`,(err, result)=>{
        if(err){
            res.status(400).json(err);
        }
        res.status(200).json(result);
    });
});

app.listen(3000);