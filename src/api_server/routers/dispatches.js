/*!
 * kin
 * Copyright(c) 2016-2017 Benoit Person
 * Apache 2.0 Licensed
 */
const _ = require("lodash");

const express = require("express");

const mysql = require("mysql");

const router = express.Router(); // eslint-disable-line new-cap

const con = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "root",
    database: "conexdispatch"
})

con.connect((err) => {
    if (err) {
        throw err;
    }
})

// location

router.get("/locations", (req, res, next) => {
    const sql = "SELECT * from locations";
    con.query(sql, (err, result) => {
        if (err) throw err;
        res.json(result);
        next();
    })
});

router.post("/locations/add", (req, res, next) => {
    // TODO: Insert data to db
    next();
});

router.post("/location", (req, res, next) => {
    // TODO: Return location data by id
    next();
});

// Match

router.get("/matches", (req, res, next) => {
    const sql = `SELECT m.id, l.name as location_name, u.name as user, u.phone_number as phone_number 
                FROM matches m 
                LEFT JOIN users u ON m.user_id = u.id 
                LEFT JOIN locations l ON l.id = m.location_id`;
    con.query(sql, (err, matches) => {
        if (err) throw err;
        const location_sql = "SELECT id, name as location_name from locations";
        con.query(location_sql, (_err, locations) => {
            if (_err) throw _err;
            let _locations = locations;
            for (let i = _locations.length - 1; i >= 0; i-=1) {
                _locations[i].drivers = [];
                for (let j = matches.length - 1; j >= 0; j-=1) {
                    if (matches[j].location_name === _locations[i].location_name) {
                        const _match = matches[j];
                        const _t = {};
                        _t.name = _match.user;
                        _t.phone_number = _match.phone_number;
                        // _t.phone_number = _match.phone_number;
                        _locations[i].drivers.push(_t);
                    }
                }
            }
            _locations = _.orderBy(_locations, ["id"], ["asc"]);
            res.json(_locations);
            next();
        });
    });
});

router.post("/matches/add", (req, res, next) => {
    // TODO: Insert new match to db
    const sql = "INSERT ";
    con.query(sql, (err, result) => {
        if (err) throw err;
        res.json(result);
        next();
    })
});

router.get("/matches/location", (req, res, next) => {
    // TODO: Return all drivers in certain location
    const sql = "INSERT ";
    con.query(sql, (err, result) => {
        if (err) throw err;
        res.json(result);
        next();
    })
});

router.get("/matches/driver", (req, res, next) => {
    // TODO: Return all locations for certain driver
    const sql = "INSERT ";
    con.query(sql, (err, result) => {
        if (err) throw err;
        res.json(result);
        next();
    })
});

// User

router.get("/users", (req, res, next) => {
    const sql = "SELECT * from users";
    con.query(sql, (err, result) => {
        if (err) throw err;
        res.json(result);
        next();
    })
});

router.get("/users/drivers", (req, res, next) => {
    const sql = "SELECT * from users WHERE role = 4";
    con.query(sql, (err, result) => {
        if (err) throw err;
        res.json(result);
        next();
    })
});

router.post("/user/add", (req, res, next) => {
    // TODO: add new user
    const sql = "";
    con.query(sql, (err, result) => {
        if (err) throw err;
        res.json(result);
        next();
    });
});

router.get("/user", (req, res, next) => {
    // TODO: return user info by id
    next();
});

// Invoice

router.post("/invoice/add", (req, res, next) => {
    // TODO: add new dispatch to db
    next();
});

router.get("/invoice", (req, res, next) => {
    // TODO: return invoice data by id
    next();
});

router.get("/invoice/range", (req, res, next) => {
    // TODO: return all invoices in certain range from start_date to end_date
    next();
});

module.exports = {
    router
};
