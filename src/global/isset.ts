export default function isset(variable: any) {
  if (typeof variable !== 'undefined') {
    return true;
  }
  return false;
}
