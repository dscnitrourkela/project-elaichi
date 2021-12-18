// @ts-ignore
export default function downloadURI(uri, name) {
  const link = document.createElement('a');
  link.setAttribute('download', name);
  link.setAttribute('href', uri);
  link.setAttribute('target', '_blank');
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
}
