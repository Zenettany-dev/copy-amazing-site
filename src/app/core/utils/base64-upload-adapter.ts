class Base64UploadAdapter {
  loader: any;

  constructor(loader: any) {
    this.loader = loader;
  }

  upload(): Promise<{ default: string }> {
    return this.loader.file.then(
      (file: File) =>
        new Promise((resolve, reject) => {
          const reader = new FileReader();
          reader.onload = () => resolve({ default: reader.result as string });
          reader.onerror = (err) => reject(err);
          reader.readAsDataURL(file);
        })
    );
  }

  abort() {}
}

export function Base64UploadAdapterPlugin(editor: any) {
  editor.plugins.get('FileRepository').createUploadAdapter = (loader: any) => {
    return new Base64UploadAdapter(loader);
  };
}