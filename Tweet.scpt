FasdUAS 1.101.10   ��   ��    k             l     ��  ��    M G  This script was put together with the help of the following sources:      � 	 	 �     T h i s   s c r i p t   w a s   p u t   t o g e t h e r   w i t h   t h e   h e l p   o f   t h e   f o l l o w i n g   s o u r c e s :     
  
 l     ��  ��    T N  http://blog.codahale.com/2007/01/15/tweet-twitter-quicksilver/ by Coda Hale      �   �     h t t p : / / b l o g . c o d a h a l e . c o m / 2 0 0 7 / 0 1 / 1 5 / t w e e t - t w i t t e r - q u i c k s i l v e r /   b y   C o d a   H a l e        l     ��  ��    p j  http://i.grahamenglish.net/540/iquicktwitter-my-quicksilver-twitter-ichat-growl-hack/ by Graham English      �   �     h t t p : / / i . g r a h a m e n g l i s h . n e t / 5 4 0 / i q u i c k t w i t t e r - m y - q u i c k s i l v e r - t w i t t e r - i c h a t - g r o w l - h a c k /   b y   G r a h a m   E n g l i s h        l     ��  ��     y  http://www.leancrew.com/all-this/2009/02/url-shortening-scripts-fixed-i-think/ by @drdrang (fix for &ampersand issues)      �   �     h t t p : / / w w w . l e a n c r e w . c o m / a l l - t h i s / 2 0 0 9 / 0 2 / u r l - s h o r t e n i n g - s c r i p t s - f i x e d - i - t h i n k /   b y   @ d r d r a n g   ( f i x   f o r   & a m p e r s a n d   i s s u e s )        l     ��  ��    C =  put together and adapted by @ptujec to work with LaunchBar      �   z     p u t   t o g e t h e r   a n d   a d a p t e d   b y   @ p t u j e c   t o   w o r k   w i t h   L a u n c h B a r        l     ��   !��     V P  minor changes to convert urls to tiny versions by @ctwise (http://tedwise.com)    ! � " " �     m i n o r   c h a n g e s   t o   c o n v e r t   u r l s   t o   t i n y   v e r s i o n s   b y   @ c t w i s e   ( h t t p : / / t e d w i s e . c o m )   # $ # l     �� % &��   % L F---------------------------------------------------------------------     & � ' ' � - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -   $  ( ) ( l     ��������  ��  ��   )  * + * l     ��������  ��  ��   +  , - , l     �� . /��   . "  take string from LaunchBar     / � 0 0 8   t a k e   s t r i n g   f r o m   L a u n c h B a r   -  1 2 1 i      3 4 3 I      �� 5���� 0 handle_string   5  6�� 6 o      ���� 	0 tweet  ��  ��   4 k     � 7 7  8 9 8 l     �� : ;��   :   shorten urls    ; � < <    s h o r t e n   u r l s 9  = > = l     ��������  ��  ��   >  ? @ ? l     �� A B��   A   do wordcount     B � C C    d o   w o r d c o u n t   @  D E D r      F G F I    �� H��
�� .sysoexecTEXT���     TEXT H b      I J I b      K L K m      M M � N N 
 e c h o   L n     O P O 1    ��
�� 
strq P o    ���� 	0 tweet   J m     Q Q � R R    |   w c   - c��   G o      ���� 0 	wordcount   E  S T S r     U V U I   �� W��
�� .sysoexecTEXT���     TEXT W b     X Y X b     Z [ Z m     \ \ � ] ] 
 e c h o   [ n     ^ _ ^ 1    ��
�� 
strq _ o    ���� 0 	wordcount   Y m     ` ` � a a *   |   s e d   ' s / ^ [         ] * / / '��   V o      ���� 0 	wordcount   T  b c b l   ��������  ��  ��   c  d e d Z    o f g���� f ?    ! h i h c     j k j o    ���� 0 	wordcount   k m    ��
�� 
long i m     ���� � g k   $ k l l  m n m l  $ $��������  ��  ��   n  o p o r   $ , q r q I   $ *�� s���� 0 replace_http   s  t�� t o   % &���� 	0 tweet  ��  ��   r o      ���� 	0 tweet   p  u v u r   - : w x w I  - 8�� y��
�� .sysoexecTEXT���     TEXT y b   - 4 z { z b   - 2 | } | m   - . ~ ~ �   
 e c h o   } n   . 1 � � � 1   / 1��
�� 
strq � o   . /���� 	0 tweet   { m   2 3 � � � � �    |   w c   - c��   x o      ���� 0 	wordcount   v  � � � r   ; H � � � I  ; F�� ���
�� .sysoexecTEXT���     TEXT � b   ; B � � � b   ; @ � � � m   ; < � � � � � 
 e c h o   � n   < ? � � � 1   = ?��
�� 
strq � o   < =���� 0 	wordcount   � m   @ A � � � � � *   |   s e d   ' s / ^ [         ] * / / '��   � o      ���� 0 	wordcount   �  � � � l  I I��������  ��  ��   �  ��� � Z   I k � ����� � ?   I N � � � c   I L � � � o   I J���� 0 	wordcount   � m   J K��
�� 
long � m   L M���� � � k   Q g � �  � � � l  Q Q�� � ���   � ; 5 notify when tweet contains more than 140 characters     � � � � j   n o t i f y   w h e n   t w e e t   c o n t a i n s   m o r e   t h a n   1 4 0   c h a r a c t e r s   �  � � � n  Q V � � � I   R V�������� 0 growlregister growlRegister��  ��   �  f   Q R �  � � � I   W d�� ����� 0 growlnotify growlNotify �  � � � m   X Y � � � � �  T w e e t   t o o   l o n g �  ��� � b   Y ` � � � b   Y \ � � � m   Y Z � � � � �  ( � o   Z [���� 0 	wordcount   � m   \ _ � � � � �  )   c h a r a c t e r s��  ��   �  ��� � L   e g � � o   e f���� 0 nothing  ��  ��  ��  ��  ��  ��   e  � � � l  p p��������  ��  ��   �  � � � l  p p�� � ���   �  do tweetescape     � � � �  d o   t w e e t e s c a p e   �  � � � r   p x � � � I   p v�� ����� 0 tweetescape   �  ��� � o   q r���� 	0 tweet  ��  ��   � o      ���� 0 	tweet_new   �  � � � l  y y��������  ��  ��   �  � � � l  y y�� � ���   � + % take logininformation from keychain     � � � � J   t a k e   l o g i n i n f o r m a t i o n   f r o m   k e y c h a i n   �  � � � O   y � � � � k    � � �  � � � r    � � � � 6   � � � � n    � � � � 4  � ��� �
�� 
cint � m   � �����  � 1    ���
�� 
pckc � =  � � � � � 1   � ���
�� 
pnam � m   � � � � � � �  t w i t t e r . c o m � o      ���� 0 twitter_key   �  ��� � r   � � � � � n   � � � � � 1   � ���
�� 
strq � l  � � ����� � b   � � � � � b   � � � � � n   � � � � � 1   � ���
�� 
pact � o   � ����� 0 twitter_key   � m   � � � � � � �  : � n   � � � � � 1   � ���
�� 
ppas � o   � ����� 0 twitter_key  ��  ��   � o      ���� 0 twitter_login  ��   � m   y | � �                                                                                  kscr  alis    �  Macintosh HD               ƾN�H+    l�Keychain Scripting.app                                           ���s$        ����  	                ScriptingAdditions    ƾ2�      �s�      l�   �   �  EMacintosh HD:System:Library:ScriptingAdditions:Keychain Scripting.app   .  K e y c h a i n   S c r i p t i n g . a p p    M a c i n t o s h   H D  8System/Library/ScriptingAdditions/Keychain Scripting.app  / ��   �  � � � l  � ���������  ��  ��   �  � � � n  � � � � � I   � ��������� 0 growlregister growlRegister��  ��   �  f   � � �  � � � l  � ��� � ���   �   update twitter     � � � �     u p d a t e   t w i t t e r   �  ��� � Q   � � � � � � k   � � � �  �  � r   � � n   � � 1   � ���
�� 
strq l  � ����� b   � � m   � � �		 4 s o u r c e = l a u n c h b a r a t & s t a t u s = o   � ����� 0 	tweet_new  ��  ��   o      ���� 0 twitter_status    

 r   � � I  � �����
�� .sysoexecTEXT���     TEXT b   � � b   � � b   � � b   � � m   � � �  c u r l   - - u s e r   o   � ����� 0 twitter_login   m   � � �    - - d a t a - b i n a r y   o   � ����� 0 twitter_status   m   � � � P   h t t p : / / t w i t t e r . c o m / s t a t u s e s / u p d a t e . j s o n��   o      ���� 0 results    l  � ���������  ��  ��     l  � ���!"��  !   display dialog results    " �## 0   d i s p l a y   d i a l o g   r e s u l t s    $%$ l  � ��&'�  & C = you can change "Tweet" into a diffent text e.g. "Zwitscher"    ' �(( z   y o u   c a n   c h a n g e   " T w e e t "   i n t o   a   d i f f e n t   t e x t   e . g .   " Z w i t s c h e r "  % )�~) I   � ��}*�|�} 0 growlnotify growlNotify* +,+ m   � �-- �..  T w e e t   s e n t, /�{/ o   � ��z�z 	0 tweet  �{  �|  �~   � R      �y�x�w
�y .ascrerr ****      � ****�x  �w   � k   � �00 121 l  � ��v34�v  3   Display error message   4 �55 ,   D i s p l a y   e r r o r   m e s s a g e2 6�u6 I   � ��t7�s�t 0 growlnotify growlNotify7 898 m   � �:: �;;  E r r o r   T w e e t i n g .9 <�r< m   � �== �>> < Y o u   h a v e   f u c k e d   u p ,   t r y   a g a i n .�r  �s  �u  ��   2 ?@? l     �q�p�o�q  �p  �o  @ ABA l     �nCD�n  C / ) fix for &ampersand issues (by @drdrang)    D �EE R   f i x   f o r   & a m p e r s a n d   i s s u e s   ( b y   @ d r d r a n g )  B FGF i    HIH I      �mJ�l�m 0 tweetescape  J K�kK o      �j�j 	0 tweet  �k  �l  I k     LL MNM r     OPO b     QRQ b     STS m     UU �VV R 
 f r o m   u r l l i b   i m p o r t   q u o t e 
 p r i n t   q u o t e ( " " "T o    �i�i 	0 tweet  R m    WW �XX  " " " ,   " / : " ) 
P o      �h�h 0 cmd  N Y�gY L    ZZ l   [�f�e[ I   �d\�c
�d .sysoexecTEXT���     TEXT\ b    ]^] m    	__ �``  p y t h o n   - c  ^ l  	 a�b�aa n   	 bcb 1   
 �`
�` 
strqc o   	 
�_�_ 0 cmd  �b  �a  �c  �f  �e  �g  G ded l     �^�]�\�^  �]  �\  e fgf l     �[hi�[  h 2 , additional scripting for Growlnotification    i �jj X   a d d i t i o n a l   s c r i p t i n g   f o r   G r o w l n o t i f i c a t i o n  g klk w      mnm k      oo pqp i    rsr I      �Z�Y�X�Z 0 growlregister growlRegister�Y  �X  s O     tut I   �W�Vv
�W .registernull��� ��� null�V  v �Uwx
�U 
applw m    yy �zz 
 T w e e tx �T{|
�T 
anot{ J    }} ~�S~ m    	 ��� 
 A l e r t�S  | �R��
�R 
dnot� J    �� ��Q� m    �� ��� 
 A l e r t�Q  � �P��O
�P 
iapp� m    �� ���  L a u n c h b a r . a p p�O  u m     ��2                                                                                  GRRR  alis    �  Macintosh HD               ƾN�H+   ��GrowlHelperApp.app                                              �)�~-P        ����  	                	Resources     ƾ2�      �~0     �� �� �� �  �  YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  q ��N� i    ��� I      �M��L�M 0 growlnotify growlNotify� ��� o      �K�K 0 grrtitle grrTitle� ��J� o      �I�I  0 grrdescription grrDescription�J  �L  � O     ��� I   �H�G�
�H .notifygrnull��� ��� null�G  � �F��
�F 
name� m    �� ��� 
 A l e r t� �E��
�E 
titl� o    	�D�D 0 grrtitle grrTitle� �C��
�C 
desc� o   
 �B�B  0 grrdescription grrDescription� �A��
�A 
appl� m    �� ��� 
 T w e e t� �@��?
�@ 
ifil� m    �� ��� t ~ / L i b r a r y / A p p l i c a t i o n   S u p p o r t / L a u n c h B a r / A c t i o n s / T w e e t . s c p t�?  � m     ��2                                                                                  GRRR  alis    �  Macintosh HD               ƾN�H+   ��GrowlHelperApp.app                                              �)�~-P        ����  	                	Resources     ƾ2�      �~0     �� �� �� �  �  YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  �N  n2                                                                                  GRRR  alis    �  Macintosh HD               ƾN�H+   ��GrowlHelperApp.app                                              �)�~-P        ����  	                	Resources     ƾ2�      �~0     �� �� �� �  �  YMacintosh HD:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c i n t o s h   H D  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  l ��� l     �>�=�<�>  �=  �<  � ��� l     �;���;  � 7 1 This uses the built in splitting in AppleScript.   � ��� b   T h i s   u s e s   t h e   b u i l t   i n   s p l i t t i n g   i n   A p p l e S c r i p t .� ��� l     �:���:  � 5 / Most of the code just restores the delimiters.   � ��� ^   M o s t   o f   t h e   c o d e   j u s t   r e s t o r e s   t h e   d e l i m i t e r s .� ��� i    ��� I      �9��8�9 	0 split  � ��� o      �7�7 0 thetext theText� ��6� o      �5�5 0 	splittext 	splitText�6  �8  � k     �� ��� r     ��� n    ��� 1    �4
�4 
txdl� 1     �3
�3 
ascr� o      �2�2 0 tid  � ��� r    ��� o    �1�1 0 	splittext 	splitText� n     ��� 1    
�0
�0 
txdl� 1    �/
�/ 
ascr� ��� r    ��� n    ��� 2   �.
�. 
citm� o    �-�- 0 thetext theText� o      �,�, 0 thetextitems theTextItems� ��� r    ��� o    �+�+ 0 tid  � n     ��� 1    �*
�* 
txdl� 1    �)
�) 
ascr� ��(� L    �� o    �'�' 0 thetextitems theTextItems�(  � ��� l     �&�%�$�&  �%  �$  � ��� l     �#���#  � E ? I tried the opposite of the split implementation but for some    � ��� ~   I   t r i e d   t h e   o p p o s i t e   o f   t h e   s p l i t   i m p l e m e n t a t i o n   b u t   f o r   s o m e  � ��� l     �"���"  � &   reason it doesn't work reliably   � ��� @   r e a s o n   i t   d o e s n ' t   w o r k   r e l i a b l y� ��� i    ��� I      �!�� �! 0 join  � ��� o      �� 0 thelist theList� ��� o      �� 0 jointext joinText�  �   � k     2�� ��� r     ��� m     �� ���  � 1      �
� 
rslt� ��� X    .���� Z    )����� =    ��� n    ��� 1    �
� 
leng� 1    �
� 
rslt� m    ��  � r    ��� o    �� 0 thetoken theToken� 1      �
� 
rslt�  � r   " )��� b   " '��� b   " %   1   " #�
� 
rslt o   # $�� 0 jointext joinText� o   % &�� 0 thetoken theToken� 1      �
� 
rslt� 0 thetoken theToken� o    �� 0 thelist theList� � L   / 2 1   / 1�
� 
rslt�  �  l     ����  �  �    l     �
	�
   . ( Send the url to tiny url for shortening   	 �

 P   S e n d   t h e   u r l   t o   t i n y   u r l   f o r   s h o r t e n i n g  i     I      �	��	 0 shorten_url   � o      �� 0 theurl theURL�  �   k       r      I     ��� 0 tweetescape   � o    �� 0 theurl theURL�  �   o      �� 0 theurl theURL  l  	 	� �����   ��  ��    r   	  b   	  b   	  !  l 	 	 
"����" m   	 
## �$$ p c u r l   - - s t d e r r   / d e v / n u l l   " h t t p : / / u . n u / u n u - a p i - s i m p l e ? u r l =��  ��  ! o   
 ���� 0 theurl theURL m    %% �&&  " o      ���� 0 curlcmd curlCMD '(' l   ��������  ��  ��  ( )*) r    +,+ I   ��-��
�� .sysoexecTEXT���     TEXT- o    ���� 0 curlcmd curlCMD��  , o      ���� 0 results  * .��. L    // o    ���� 0 results  ��   010 l     ��������  ��  ��  1 232 l     ��45��  4 ; 5 Find everything that looks like a URL and shorten it   5 �66 j   F i n d   e v e r y t h i n g   t h a t   l o o k s   l i k e   a   U R L   a n d   s h o r t e n   i t3 787 l     ��9:��  9 = 7 The number 25 is the length of a tiny url, no point in   : �;; n   T h e   n u m b e r   2 5   i s   t h e   l e n g t h   o f   a   t i n y   u r l ,   n o   p o i n t   i n8 <=< l     ��>?��  > 3 - shortening a url if it's already below that.   ? �@@ Z   s h o r t e n i n g   a   u r l   i f   i t ' s   a l r e a d y   b e l o w   t h a t .= A��A i    BCB I      ��D���� 0 replace_http  D E��E o      ���� 0 thetext theText��  ��  C k     iFF GHG r     	IJI I     ��K���� 	0 split  K LML o    ���� 0 thetext theTextM N��N m    OO �PP   ��  ��  J o      ���� 
0 tokens  H QRQ r   
 STS J   
 ����  T o      ���� 
0 output  R UVU X    `W��XW Z    [YZ[\Y F    ,]^] l   "_����_ C    "`a` o     ���� 0 thetoken theTokena m     !bb �cc  h t t p : / /��  ��  ^ ?   % *ded n   % (fgf 1   & (��
�� 
lengg o   % &���� 0 thetoken theTokene m   ( )���� Z r   / 8hih I   / 5��j���� 0 shorten_url  j k��k o   0 1���� 0 thetoken theToken��  ��  i l     l����l n      mnm  ;   6 7n o   5 6���� 
0 output  ��  ��  [ opo F   ; Hqrq l  ; >s����s C   ; >tut o   ; <���� 0 thetoken theTokenu m   < =vv �ww  w w w .��  ��  r ?   A Fxyx n   A Dz{z 1   B D��
�� 
leng{ o   A B���� 0 thetoken theTokeny m   D E���� p |��| r   K T}~} I   K Q������ 0 shorten_url   ���� o   L M���� 0 thetoken theToken��  ��  ~ l     ������ n      ���  ;   R S� o   Q R���� 
0 output  ��  ��  ��  \ r   W [��� o   W X���� 0 thetoken theToken� l     ������ n      ���  ;   Y Z� o   X Y���� 
0 output  ��  ��  �� 0 thetoken theTokenX o    ���� 
0 tokens  V ���� L   a i�� I   a h������� 0 join  � ��� o   b c���� 
0 output  � ���� m   c d�� ���   ��  ��  ��  ��       
�������������  � ������������������ 0 handle_string  �� 0 tweetescape  �� 0 growlregister growlRegister�� 0 growlnotify growlNotify�� 	0 split  �� 0 join  �� 0 shorten_url  �� 0 replace_http  � �� 4���������� 0 handle_string  �� ����� �  ���� 	0 tweet  ��  � ������������������ 	0 tweet  �� 0 	wordcount  �� 0 nothing  �� 0 	tweet_new  �� 0 twitter_key  �� 0 twitter_login  �� 0 twitter_status  �� 0 results  � % M�� Q�� \ `������ ~ � � ��� � � ����� �������� ��� ���-����:=
�� 
strq
�� .sysoexecTEXT���     TEXT
�� 
long�� ��� 0 replace_http  �� 0 growlregister growlRegister�� 0 growlnotify growlNotify�� 0 tweetescape  
�� 
pckc
�� 
cint�  
�� 
pnam
�� 
pact
�� 
ppas��  ��  �� ���,%�%j E�O��,%�%j E�O��&� L*�k+ E�O��,%�%j E�O��,%�%j E�O��&� )j+ O*��%a %l+ O�Y hY hO*�k+ E�Oa  1*a ,a k/a [a ,\Za 81E�O�a ,a %�a ,%�,E�UO)j+ O .a �%�,E�Oa �%a %�%a %j E�O*a  �l+ W X ! "*a #a $l+ � ��I���������� 0 tweetescape  �� ����� �  ���� 	0 tweet  ��  � ������ 	0 tweet  �� 0 cmd  � UW_����
�� 
strq
�� .sysoexecTEXT���     TEXT�� �%�%E�O��,%j � ��s���������� 0 growlregister growlRegister��  ��  �  � ���y�����������
�� 
appl
�� 
anot
�� 
dnot
�� 
iapp�� 
� .registernull��� ��� null�� � *����kv��kv��� 
U� �~��}�|���{�~ 0 growlnotify growlNotify�} �z��z �  �y�x�y 0 grrtitle grrTitle�x  0 grrdescription grrDescription�|  � �w�v�w 0 grrtitle grrTitle�v  0 grrdescription grrDescription� ��u��t�s�r��q��p�o
�u 
name
�t 
titl
�s 
desc
�r 
appl
�q 
ifil�p 

�o .notifygrnull��� ��� null�{ � *��������� 
U� �n��m�l���k�n 	0 split  �m �j��j �  �i�h�i 0 thetext theText�h 0 	splittext 	splitText�l  � �g�f�e�d�g 0 thetext theText�f 0 	splittext 	splitText�e 0 tid  �d 0 thetextitems theTextItems� �c�b�a
�c 
ascr
�b 
txdl
�a 
citm�k ��,E�O���,FO��-E�O���,FO�� �`��_�^���]�` 0 join  �_ �\��\ �  �[�Z�[ 0 thelist theList�Z 0 jointext joinText�^  � �Y�X�W�Y 0 thelist theList�X 0 jointext joinText�W 0 thetoken theToken� ��V�U�T�S�R
�V 
rslt
�U 
kocl
�T 
cobj
�S .corecnte****       ****
�R 
leng�] 3�E�O )�[��l kh ��,j  �E�Y 	��%�%E�[OY��O�E� �Q�P�O���N�Q 0 shorten_url  �P �M��M �  �L�L 0 theurl theURL�O  � �K�J�I�K 0 theurl theURL�J 0 curlcmd curlCMD�I 0 results  � �H#%�G�H 0 tweetescape  
�G .sysoexecTEXT���     TEXT�N *�k+  E�O�%�%E�O�j E�O�� �FC�E�D���C�F 0 replace_http  �E �B��B �  �A�A 0 thetext theText�D  � �@�?�>�=�@ 0 thetext theText�? 
0 tokens  �> 
0 output  �= 0 thetoken theToken� O�<�;�:�9b�8�7�6�5v��4�< 	0 split  
�; 
kocl
�: 
cobj
�9 .corecnte****       ****
�8 
leng�7 
�6 
bool�5 0 shorten_url  �4 0 join  �C j*��l+ E�OjvE�O P�[��l kh ��	 	��,��& *�k+ 	�6FY "��	 	��,��& *�k+ 	�6FY ��6F[OY��O*��l+ ascr  ��ޭ