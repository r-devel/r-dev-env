document.addEventListener('DOMContentLoaded', function() {
    var clipboard = new ClipboardJS('.btn');

    clipboard.on('success', function(e) {
        console.info('Text:', e.text);
        e.clearSelection();
    });

    clipboard.on('error', function(e) {
        console.error('Action:', e.action);
        console.error('Trigger:', e.trigger);
    });
});
