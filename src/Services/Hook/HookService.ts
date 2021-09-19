export default class HookService {
  // eslint-disable-next-line class-methods-use-this
  github(event: any) {
    try {
      if (event) {
        console.log(event);
      } else {
        console.log('Hoje não');
      }
      return { hello: 'hello' };
    } catch (error) {
      return { error: 1, fullError: error };
    }
  }
}
