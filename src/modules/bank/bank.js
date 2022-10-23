const model = require('./model');
module.exports = {
    GetBank: async (req, res) => {
        try {
            const { sum } = req.headers;
            res.json(await model.getBanks(sum));
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },
};
