import { Router } from 'express';

const router = Router();

router.use('/ssh', require('./Ssh'));
router.use('/user', require('./User'));
router.use('/hook', require('./Hook'));

module.exports = router;
