const model = require('./model');
module.exports = {
    GetCompany: async (_, res) => {
        try {
            res.json(await model.getCompany());
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },
    GetComplex: async (req, res) => {
        try {
            const { id } = req.headers;
            res.json(await model.getComplex(id));
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },
    GetRoom: async (req, res) => {
        try {
            const { id } = req.headers;
            res.json(await model.getRoom(id));
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },
};
