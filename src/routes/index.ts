import { Router } from 'express';

const router = Router();

router.use('/ssh', require('./ssh'));
router.use('/user', require('./User'));

module.exports = router;
