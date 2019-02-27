/*!
 * kin
 * Copyright(c) 2016-2017 Benoit Person
 * Apache 2.0 Licensed
 */
const _ = require("lodash");

const express = require("express");

const mysql = require("mysql");

const querystring = require("querystring");

const concat = require("concat-stream");

const bodyParser = require("body-parser");

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
    const sql = `SELECT m.id, l.name as location_name, u.id as driver_id, u.name as user, u.phone_number as phone_number 
                FROM matches m 
                LEFT JOIN users u ON m.user_id = u.id 
                LEFT JOIN locations l ON l.id = m.location_id`;
    con.query(sql, (err, matches) => {
        if (err) throw err;
        const location_sql = "SELECT id as location_id, name as location_name from locations";
        con.query(location_sql, (_err, locations) => {
            if (_err) throw _err;
            let _locations = locations;
            for (let i = _locations.length - 1; i >= 0; i-=1) {
                _locations[i].drivers = [];
                for (let j = 0; j < matches.length; j+=1) {
                    if (matches[j].location_name === _locations[i].location_name) {
                        const _match = matches[j];
                        const _t = {};
                        _t.user_id = _match.driver_id;
                        _t.name = _match.user;
                        _t.phone_number = _match.phone_number;
                        // _t.phone_number = _match.phone_number;
                        _locations[i].drivers.push(_t);
                    }
                }
            }
            _locations = _.orderBy(_locations, ["location_id"], ["asc"]);
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

// Event

router.post("/event/add", (req, res, next) => {
    // TODO: add new dispatch to db

    req.setEncoding('utf8');
    req.pipe(concat(function(data){
        req.body = data;
        const requestData = JSON.parse(req.body);
    
        const sql = `INSERT INTO events (
                        assigned, ready, invoice_no, location_id, driver_id, event_creator,
                        date, payment_status, payment_gateway, title, description, line_item,
                        expected_delivery_time, expected_ext_time, delivery_address, color,
                        delivery_progress, on_site_contact, total_order, customer_info, 
                        sales_rep, notes, quote_url, latest_invoice_url, po_number)
                    VALUES (
                        "${requestData.assigned}", "${requestData.ready}", "${requestData.invoice_no}", 
                        "${requestData.location_id}", "${requestData.driver_id}", "${requestData.event_creator}", 
                        "${requestData.date}", "${requestData.payment_status}", "${requestData.payment_gateway}", 
                        "${requestData.title}", "${requestData.description}", "${requestData.line_item}", 
                        "${requestData.expected_delivery_time}", "${requestData.expected_ext_time}", 
                        "${requestData.delivery_address}", "${requestData.color}", "${requestData.delivery_progress}", 
                        "${requestData.on_site_contact}", "${requestData.total_order}", "${requestData.customer_info}", 
                        "${requestData.sales_rep}", "${requestData.notes}", "${requestData.quote_url}", 
                        "${requestData.latest_invoice_url}", "${requestData.po_number}")`;

        con.query(sql, (err, result) => {
            if (err) {
                res.json(err);
                next();
            }
            res.json(result);
            next();
        });

    }));
});

router.post("/event/update", (req, res, next) => {
    // TODO: add new dispatch to db
    console.info(req);
    res.json("aaa");
    next();
});

router.get("/event", (req, res, next) => {
    // TODO: return invoice data by id
    next();
});

router.get("/events/range", (req, res, next) => {
    // TODO: return all invoices in certain range from start_date to end_date
    next();
});

router.get("/events", (req, res, next) => {
    // TODO: return all invoices in certain range from start_date to end_date

    const sql = "SELECT * from events";
    con.query(sql, (err, result) => {
        if (err) throw err;
        const _result = result;
        for (let i = _result.length - 1; i >= 0; i-=1) {
            _result[i].date = _result[i].date.toISOString().substring(0,10);
        }
        res.json(_result);
        next();
    });
});

router.get("/all", (req, res, next) => {
    // TODO: return all invoices in certain range from start_date to end_date

    const sql_event = "SELECT * from events";
    const sql_match = "SELECT * from matches";
    const sql_driver = "SELECT * from users WHERE role = 4";
    con.query(sql_event, (evt_err, evt_result) => {
        if (evt_err) throw evt_err;
        con.query(sql_match, (mch_err, mch_result) => {
            if (mch_err) throw mch_err;
            con.query(sql_driver, (drv_err, drv_result) => {
                if (drv_err) throw drv_err;
                res.json(
                    {
                        "events": evt_result,
                        "matches": mch_result,
                        "drivers": drv_result
                    }
                );
                next();
            });
        });
    });
});

module.exports = {
    router
};
