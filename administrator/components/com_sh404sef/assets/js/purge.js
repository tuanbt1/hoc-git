/**
 * sh404SEF - SEO extension for Joomla!
 *
 * @author      Yannick Gaultier
 * @copyright   (c) Yannick Gaultier - Weeblr llc - 2020
 * @package     sh404SEF
 * @license     http://www.gnu.org/copyleft/gpl.html GNU/GPL
 * @version     4.18.2.3981
 * @date        2019-12-23
 */

;
(function (app, $) {

    function sendPurge(event) {

        var $element = $(this);
        var requestType = this.getAttribute('data-request_type')

        var purge_data = {
            'task': this.getAttribute('data-task'),
            'request_type': requestType
        };
        purge_data[this.getAttribute('data-token')] = 1;
        var ajaUri = this.getAttribute('data-ajax_uri');

        // Remove js messages, if they exist.
        Joomla.removeMessages();

        weeblrApp.spinner.start('wb_purge_spinner_' + requestType);

        // doing ajax request
        jQuery.ajax({
            method: "POST",
            url: ajaUri,
            data: purge_data,
            datatype: 'json'
        })
            .fail(function (jqXHR, textStatus, error) {
                // Remove the spinning icon.
                weeblrApp.spinner.stop('wb_purge_spinner_' + requestType);
                Joomla.renderMessages(Joomla.ajaxErrorsMessages(jqXHR, textStatus, error));
            })
            .done(function (response) {
                // Remove the spinning icon.
                weeblrApp.spinner.stop('wb_purge_spinner_' + requestType);

                if (response.data) {
                    // Check if everything is OK
                    if (response.data.result == true) {
                        $element.addClass('wb-purge-button-disabled');
                        $element.off('click', sendPurge);
                    }
                }

                // Render messages, if any. There are only message in case of errors.
                if (typeof response.messages == 'object' && response.messages !== null) {
                    Joomla.renderMessages(response.messages);
                    setTimeout(
                        Joomla.removeMessages,
                        5000
                    );
                }
            });
    }

    function onReady() {
        $('.wb_purge_details').on('click', sendPurge);
    }

    $(document).ready(onReady);

})(window.__sh404sefJs = window.__sh404sefJs || {}, jQuery);
