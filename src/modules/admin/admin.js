const model = require('./model');
module.exports = {
    GetOrders: async (_, res) => {
        try {
            res.json(await model.getOrders());
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },

    DeleteOrder: async (req, res) => {
        try {
            const { id } = req.body;
            res.send(await model.deleteOrder(id));
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },

    InsertCompany: async (req, res) => {
        try {
            const { name } = req.body;
            res.send(await model.insertCompany(name));
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },

    DeleteCompany: async (req, res) => {
        try {
            const { id } = req.body;
            res.send(await model.deleteCompany(id));
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },

    UpdateCompany: async (req, res) => {
        try {
            const { id, name } = req.body;
            res.send(await model.updateCompany(id, name));
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },

    GetComplexes: async (_, res) => {
        try {
            res.json(await model.getComplexes());
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },

    InsertComplex: async (req, res) => {
        try {
            const { name, id } = req.body;
            res.send(await model.insertComplex(name, id));
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },

    DeleteComplex: async (req, res) => {
        try {
            const { id } = req.body;
            res.send(await model.deleteComplex(id));
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },

    UpdateComplex: async (req, res) => {
        try {
            const { id, name } = req.body;
            res.send(await model.updateComplex(id, name));
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },

    InsertRoom: async (req, res) => {
        try {
            const { count, square, price, id } = req.body;
            res.send(await model.insertRoom(count, square, price, id));
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },

    DeleteRoom: async (req, res) => {
        try {
            const { id } = req.body;
            res.send(await model.deleteRoom(id));
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },

    UpdateRoom: async (req, res) => {
        try {
            const { id, count, square, price } = req.body;
            res.send(await model.updateRoom(id, count, square, price));
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },

    GetAllRooms: async (_, res) => {
        try {
            res.json(await model.getAllRooms());
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },

    InsertBank: async (req, res) => {
        try {
            const { name, sum, service } = req.body;
            res.send(await model.insertBank(name, sum, service));
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },

    GetBanks: async (_, res) => {
        try {
            res.send(await model.getBanks());
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },

    DeleteBank: async (req, res) => {
        try {
            const { id } = req.body;
            res.send(await model.deleteBank(id));
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },

    UpdateBank: async (req, res) => {
        try {
            const { id, name, sum, service } = req.body;
            res.send(await model.updateBank(id, name, sum, service));
        } catch (err) {
            res.status(500).json({
                message: err.message,
            });
        }
    },
};
