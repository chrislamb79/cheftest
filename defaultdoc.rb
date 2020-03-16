# Add foo.html to default documents, and add '.dmg' as mime type extension at root level
iis_root 'add stuff' do
    add_default_documents ['foo.html']
    add_mime_maps ["fileExtension='.dmg',mimeType='application/octet-stream'"]
    action :add
  end