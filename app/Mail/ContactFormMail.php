<?php

namespace App\Mail;

use Illuminate\Bus\Queueable;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Mail\Mailable;
use Illuminate\Queue\SerializesModels;
use Illuminate\Http\Request;


class ContactFormMail extends Mailable
{
    use Queueable, SerializesModels;


    public $contactName;
    public $contactEmail;
    public $contactMessage;
    /**
     * Create a new message instance.
     *
     * @return void
     */
    public function __construct($contactName, $contactEmail, $contactMessage)
    {
        $this->contactName= $contactName;
        $this->contactEmail = $contactEmail;
        $this->contactMessage = $contactMessage;



    }

    /**
     * Build the message.
     *
     * @return $this
     */
    public function build(Request $request)
    {
        // return $this->markdown('emails.contact.contact-form');

        return $this->from([
            'email' => $request->email, 
            'name' => $request->name 
        ])
        ->to( env('APP_ADMIN_CONTACT') )
        ->subject( 'Message from website: ')
        ->markdown('emails.contact.contact-form')
        ->with([    
            'contactName' => $request->name,
            'contactEmail' => $request->email,
            'contactMessage' => $request->message
        ]);
    }
}
