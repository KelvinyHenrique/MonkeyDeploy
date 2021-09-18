import { Router } from 'express';

const router = Router();

router.use('/ssh', require('./Ssh'));
router.use('/user', require('./User'));

module.exports = router;
