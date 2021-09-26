import express from 'express';
import ServerController from '../Controllers/ServerController';

const router = express.Router();

router.post('/create', ServerController.create);
router.get('/find', ServerController.find);
router.get('/find/all', ServerController.findAll);
router.post('/update', ServerController.update);
router.delete('/delete', ServerController.delete);

module.exports = router;
