const model = require('./model');
module.exports = {
    GET: async (req, res) => {
        try {
            const { companyid, complexid, roomid, bankid, duration } =
                req.headers;
            res.json(
                await model.checkOrder(
                    companyid,
                    complexid,
                    roomid,
                    bankid,
                    duration
                )
            );
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },

    POST: async (req, res) => {
        try {
            console.log(req.body);
            const {
                name,
                phone,
                paymentduration,
                spayment,
                mpayment,
                bankid,
                companyid,
                complexid,
                roomid,
            } = req.body;
            res.send(
                await model.insertOrder(
                    name,
                    phone,
                    paymentduration,
                    spayment,
                    mpayment,
                    bankid,
                    companyid,
                    complexid,
                    roomid
                )
            );
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },
};
