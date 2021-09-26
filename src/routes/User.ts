import express from 'express';
import UserController from '../controllers/UserController';

const router = express.Router();

router.post('/create', UserController.create);
router.get('/find', UserController.find);
router.get('/find/all', UserController.findAll);
router.post('/update', UserController.update);
router.delete('/delete', UserController.delete);

module.exports = router;
