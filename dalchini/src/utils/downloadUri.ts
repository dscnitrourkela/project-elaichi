export default function downloadURI(
  uri: string,
  name: string | undefined
): void {
  const link = document.createElement('a');
  link.setAttribute('download', name ? name : '');
  link.setAttribute('href', uri);
  link.setAttribute('target', '_blank');
  document.body.appendChild(link);
  link.click();
  document.body.removeChild(link);
}
