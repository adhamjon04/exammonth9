const express = require('express');
const router = express.Router();
const Company = require('./company/company');
const Bank = require('./bank/bank');
const Order = require('./orders/order');
const Admin = require('./admin/admin');

router
    .get('/company', Company.GetCompany)

    .post('/admin/company', Admin.InsertCompany)

    .delete('/admin/company', Admin.DeleteCompany)

    .put('/admin/company', Admin.UpdateCompany)

    .get('/complex', Company.GetComplex)

    .get('/admin/copmlex', Admin.GetComplexes)

    .post('/admin/complex', Admin.InsertComplex)

    .delete('/admin/complex', Admin.DeleteComplex)

    .put('/admin/complex', Admin.UpdateComplex)

    .get('/rooms', Company.GetRoom)

    .get('/admin/rooms', Admin.GetAllRooms)

    .post('/admin/rooms', Admin.InsertRoom)

    .delete('/admin/rooms', Admin.DeleteRoom)

    .put('/admin/rooms', Admin.UpdateRoom)

    .get('/banks', Bank.GetBank)

    .get('/admin/banks', Admin.GetBanks)

    .post('/admin/banks', Admin.InsertBank)

    .delete('/admin/banks', Admin.DeleteBank)

    .put('/admin/banks', Admin.UpdateBank)

    .get('/order', Order.GET)

    .post('/order', Order.POST)

    .get('/admin/orders', Admin.GetOrders)

    .delete('/admin/orders', Admin.DeleteOrder);

module.exports = router;
